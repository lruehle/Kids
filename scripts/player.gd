extends CharacterBody2D
class_name Player

@export var speed = 130.0
const JUMP_VELOCITY = -350.0
@export var SWIM_GRAVITY_FACTOR = 0.25

var is_climbing = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var is_in_water : bool = false

@onready var animated_sprite = $AnimatedSprite2D

#
func _ready():
	GameManager.player = self

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
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func apply_gravity(delta):
	if not is_on_floor() && not is_climbing:
		velocity.y += gravity * delta
	elif is_climbing:
		velocity.y = 0
		if Input.is_action_pressed("move_up"):
			velocity.y = -speed
		elif Input.is_action_pressed("move_down"):
			velocity.y = speed

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
	


func _on_water_detection_2d_water_state_changed(is_in_water : bool):
	self.is_in_water = is_in_water
	print(is_in_water)
