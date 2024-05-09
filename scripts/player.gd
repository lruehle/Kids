extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -350.0

var is_climbing = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && not is_climbing:
		velocity.y += gravity * delta
	elif is_climbing:
		velocity.y = 0
		if Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("ui_down"):
			velocity.y = SPEED
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


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
	#if is_climbing:
	#	if Input.is_action_pressed("ui_up")
	#		animated_sprite.play("")
			#gravity =100
	elif is_climbing:
		animated_sprite.play("climb")
	else:
		animated_sprite.play("jump")	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _disable_collision():
	#doesnt yet seem to work
	get_node("CollisionShape2D").disabled = true
	
