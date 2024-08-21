extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Level1_Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_scenes/training_game.tscn")


func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_scenes/game_lvl_2.tscn")


func _on_level_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_scenes/game_lvl_3.tscn")


func _on_quit_button_pressed():
	get_tree().quit()



