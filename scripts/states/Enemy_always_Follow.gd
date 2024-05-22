extends State
class_name Enemy_always_Follow

@export 
var enemy: CharacterBody2D
@export 
var move_speed:= 40.0
@export
var gap_while_follow: int = 25

var player: CharacterBody2D
var target_position

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func State_Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	#move enemy towards Player while distance
	if direction.length() > gap_while_follow:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
