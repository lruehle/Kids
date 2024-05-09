extends AnimatableBody2D

#ctr while drag to reference

@onready var ray_cast_right = $RayCast2D_right
@onready var ray_cast_left = $RayCast2D_left

const SPEED = 300
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction=-1
	if ray_cast_left.is_colliding():
		direction=1
	position.x += direction * SPEED * delta
# Called when the node enters the scene tree for the first time.
