extends Node

var score
var is_climbing = false
#@onready var score_label = $Score
func _ready():
	SignalManager.connect("killzone_player_death", _on_killzone_player_death)
	#SignalManager.killzone_player_death.connect(_on_killzone_player_death)
	score = 0
	
func increase_score():
	# changed to HUD Element / Script
	#score_label = "score: " + str(score)
	score += 1
	#print(score)	

func _on_killzone_player_death():
	print("killzone death")
	score = 0
