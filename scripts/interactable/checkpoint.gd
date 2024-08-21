extends Node2D
class_name Checkpoint

@export
var spawn_Point :bool = false

var activated = false

func _ready():
	if spawn_Point:
		activate()

func activate():
	GameManager.set_current_checkpoint(self)
	activated = true
	$AnimationPlayer.play("activated")


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		#print("active")
		activate()
