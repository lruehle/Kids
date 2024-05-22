extends CharacterBody2D

@onready var sprite = $Sprite2D
@export
var mirror_sprites : bool = false

func _physics_process(delta):
	move_and_slide()
	
	# if velocity.length() > 0:
	# $AnimationPlayer.play("run")
	
	#Spriteflip._h == true for movement towards right
	if velocity.x > 0:
		sprite.flip_h = mirror_sprites
	else:
		sprite.flip_h = !mirror_sprites
