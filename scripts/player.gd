extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -350.0

var is_climbing = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D



func _physics_process(delta):
	apply_gravity(delta)
	handle_jumps()

	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# play animations:
	if is_on_floor():
		if direction ==0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif is_climbing:
		animated_sprite.play("climb")
	else:
		animated_sprite.play("jump")	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func apply_gravity(delta):
	if not is_on_floor() && not is_climbing:
		velocity.y += gravity * delta
	elif is_climbing:
		velocity.y = 0
		if Input.is_action_pressed("move_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("move_down"):
			velocity.y = SPEED

func handle_jumps():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	#shorter jump if released earlier
	else:
		if Input.is_action_just_released("jump") and velocity.y < JUMP_VELOCITY/2:
			velocity.y = JUMP_VELOCITY/2
	
func _disable_collision():
	#doesnt yet seem to work
	get_node("CollisionShape2D").disabled = true
	
