extends Area2D

# handled by ProjectSettings->Autoload->GameManager Script
#@onready var game_manager = %Game_Manager

signal coin_collected

func _on_body_entered(body):
	GameManager.increase_score()
	print("+1 coin")
	emit_signal("coin_collected")
	queue_free() #remove this coin scene from game_scene
