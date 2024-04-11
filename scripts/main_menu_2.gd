extends Control

func _ready():

	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6).timeout


func _on_button_level1_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	MusicManager.stop_music()
	
func _on_button_level2_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	MusicManager.stop_music()

func _on_button_prologue_pressed():
	get_tree().change_scene_to_file("res://scenes/introLevel.tscn")
	MusicManager.stop_music()
