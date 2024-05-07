extends Control

@onready var score_label = $Score


func _ready():
	score_label.text = "Score: "+ str(GameManager.score)



func _on_coin_collected():
	# if ready contains just this function
	#_ready()
	score_label.text = "Score: "+ str(GameManager.score)
	pass # Replace with function body.
