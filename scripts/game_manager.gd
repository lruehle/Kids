extends Node

#Game Manager is Autoloaded and keeps values inbetween Scenes during one Game Session; 
#Alternative is using one consistent Node, loading in all changing Level nodes, +1 next refactoring phase

var score
var pickup_amount
var is_climbing = false
var current_checkpoint : Checkpoint 
var player : Player

#@onready var score_label = $Score
func _ready():
	SignalManager.connect("player_death", respawn_player) #_on_killzone_player_death)
	SignalManager.connect("coin_collected", increase_score)
	SignalManager.connect("add_pickup", _on_add_pickup)
	SignalManager.connect("change_level", handle_change_level)
	print("manager connected")
	#SignalManager.killzone_player_death.connect(_on_killzone_player_death)
	score = 0
	pickup_amount = 0
	
func increase_score(amount:int):
	# changed to HUD Element / Script
	#score_label = "score: " + str(score)
	score += amount
	update_hud()
	#print(score)	

func respawn_player():
	if current_checkpoint != null:
		#player.get_node("CollisionShape2D").disabled = false
		player.position = current_checkpoint.global_position

	
func _on_killzone_player_death():
	print("killzone death")
	score = 0
	pickup_amount = 0
	update_hud()
	get_tree().reload_current_scene()
	
func _on_add_pickup(amount):
	pickup_amount += amount
	update_hud()

func update_hud():
	SignalManager.emit_signal("update_HUD_manager_values",score, pickup_amount)

func set_current_checkpoint(checkpoint : Checkpoint):
	current_checkpoint = checkpoint
	
# Level names are currently stored in the level_transition emitting the signal to change the level	
func handle_change_level(current_level_name:String):
	var next_level
	var next_level_name: String
	
	match current_level_name:
		"tutorial":
			next_level_name = "2"
		"2":
			next_level_name = "3"
		_:
			return
	#next_level = load("res://scenes/level_scenes/game_lvl_"+ next_level_name + ".tscn").instance()
	#get_tree().change_scene_to_file("res://scenes/level_scenes/game_lvl_"+ next_level_name + ".tscn") 
	get_tree().change_scene_to_file.bind("res://scenes/level_scenes/game_lvl_"+ next_level_name + ".tscn").call_deferred()
	

