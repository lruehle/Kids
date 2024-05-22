extends Area2D

#drag while holding ctr to add Timer Node from scene;
@onready var timer = $Timer
#signal player_death

func _on_body_entered(body):
	print("Player died")
	SignalManager.player_death.emit()
	#Engine.time_scale = 0.5
	#body.get_node("CollisionShape2D").set_deferred("disabled", true)
	#body.get_node("CollisionShape2D").queue_free()
	#timer.start() #on_timer_timeout triggered after timer ends


func _on_timer_timeout():
	Engine.time_scale = 1
	SignalManager.killzone_player_death.emit()
	#get_tree().reload_current_scene()

