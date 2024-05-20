extends State
class_name Enemy_Idle

@export 
var enemy: CharacterBody2D
@export
var move_speed:= 10.0

var move_direction: Vector2
var wander_time : float
var player: CharacterBody2D


func randomize_wander():
	move_direction = Vector2(randf_range(1,-1), randf_range(0.0,0.0)).normalized()
	wander_time = randf_range(1,3)
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	
func State_Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func State_Physics_Update(delta: float):
	if  enemy:
		enemy.velocity = move_direction * move_speed
		
	var direction = player.global_position - enemy.global_position
	if direction.length() < 70:
		print("transition from idle")
		Transitioned.emit(self, "Enemy_Follow")
