extends Node2D
#ctr while drag to reference
@onready var ray_cast_right = $RayCast2D_right
@onready var ray_cast_left = $RayCast2D_left
@onready var animated_sprite = $AnimatedSprite2D


const SPEED = 40

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction=-1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction=1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
