extends Node2D

@export 
var current_level_name : String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#get_tree().change_scene_to_file("res://scenes/level_scenes/game_lvl_2.tscn")
	SignalManager.emit_signal("change_level", current_level_name)
