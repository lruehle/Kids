extends Area2D

@onready var animation_player = $AnimationPlayer



func _on_body_entered(body):
	#Maybe switch to signal for Game Manager too?
	#GameManager.add_pickup()
	#signal for HUD
	#emit_signal("coin_collected")
	SignalManager.emit_signal("add_pickup",1)
	animation_player.play("pick_up")
	#queue_free() #remove this coin scene from game_scene; now run through animation
