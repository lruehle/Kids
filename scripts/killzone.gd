extends Area2D

#drag while holding ctr to add Timer Node from scene;
@onready var timer = $Timer
#signal player_death

func _on_body_entered(body):
	print("Player died")
	Engine.time_scale = 0.5
	#doesnt yet seem to work, see Player
	#body._disable_collision()
	body.get_node("CollisionShape2D").queue_free()
	timer.start() #on_timer_timeout triggered after timer ends

func _on_timer_timeout():
	Engine.time_scale = 1
	print("timeout")
	# funktioniert
	#GameManager._on_killzone_player_death()
	# emits signal twice for some reason
	SignalManager.killzone_player_death.emit()
	#emit_signal("player_death")
	print("emit")
	#GameManager.score = 0
	get_tree().reload_current_scene()
