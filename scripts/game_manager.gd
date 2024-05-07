extends Node

var score = 0
#@onready var score_label = $Score


func increase_score():
	# changed to HUD Element / Script
	#score_label = "score: " + str(score)
	score += 1
	#print(score)
