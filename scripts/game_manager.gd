extends Node

var score
var pickup_amount
var is_climbing = false

#@onready var score_label = $Score
func _ready():
	SignalManager.connect("killzone_player_death", _on_killzone_player_death)
	SignalManager.connect("coin_collected", increase_score)
	SignalManager.connect("add_pickup", _on_add_pickup)
	print("manager connected")
	#SignalManager.killzone_player_death.connect(_on_killzone_player_death)
	score = 0
	pickup_amount = 0
	
func increase_score():
	# changed to HUD Element / Script
	#score_label = "score: " + str(score)
	score += 1
	update_hud()
	#print(score)	

func _on_killzone_player_death():
	print("killzone death")
	score = 0
	pickup_amount = 0
	update_hud()
	
func _on_add_pickup(amount):
	pickup_amount += amount
	update_hud()

func update_hud():
	SignalManager.emit_signal("update_HUD_manager_values")
	
