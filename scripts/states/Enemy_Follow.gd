extends State
class_name Enemy_Follow

@export 
var enemy: CharacterBody2D
@export 
var move_speed:= 40.0
@export
var distance_to_follow: int = 110
@export
var gap_while_follow: int = 25

var player: CharacterBody2D
var target_position

# dependency injection here (?) Player could be set on awake in Game Manager & each state pulls it
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	#print("distance: ", (player.global_position - enemy.global_position).length())
	

func State_Physics_Update(delta: float):
	#if $RayCast2D_water.is_colliding():
		#print("out of water ", $RayCast2D_water.get_collider().body.name)
		#move to different point
		#Transitioned.emit(self, "enemy_idle")s
	var direction = player.global_position - enemy.global_position
	#move enemy towards Player while distance
	if direction.length() > gap_while_follow:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > distance_to_follow:
		#print("transition from follow")
		Transitioned.emit(self, "enemy_idle")
		
