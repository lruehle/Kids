extends Area2D

#drag while holding ctr to add Timer Node from scene;
@onready var timer = $Timer


func _on_body_entered(body):
	print("Player died")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start() #on_timer_timeout triggered after timer ends

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
