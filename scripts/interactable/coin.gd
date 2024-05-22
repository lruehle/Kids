extends Area2D
@onready var animation_player = $AnimationPlayer

@export
var coin_value : int = 1
# handled by ProjectSettings->Autoload->GameManager Script
#@onready var game_manager = %Game_Manager

signal coin_collected

func _on_body_entered(body):
	#Maybe switch to signal for Game Manager too?
	#GameManager.increase_score()
	#signal for HUD
	#emit_signal("coin_collected")
	SignalManager.emit_signal("coin_collected",coin_value)
	animation_player.play("pickUp_animation")
	#queue_free() #remove this coin scene from game_scene; now run through animation
