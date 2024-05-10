extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Climber"):
		#print("climber")
		if !body.is_climbing:
			body.is_climbing = true



func _on_body_exited(body):
	if body.is_in_group("Climber"):
		if body.is_climbing:
			body.is_climbing = false
