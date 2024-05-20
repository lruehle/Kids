extends State
class_name Enemy_Follow

@export 
var enemy: CharacterBody2D
@export 
var move_speed:= 40.0

var player: CharacterBody2D
var target_position

# dependency injection here (?) Player could be set on awake in Game Manager & each state pulls it
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("distance: ", (player.global_position - enemy.global_position).length())
	

#func State_Physics_Update(delta: float):
	#target_position = (player.position - position)

func State_Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	#move enemy towards Player while distance
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 70:
		print("transition from follow")
		Transitioned.emit(self, "enemy_idle")
		
