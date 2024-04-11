extends Node2D


var finished := false # for use when exiting level

func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _unhandled_input(event): # calls finish when Esc is pressed
	if event.is_action_pressed("ui_cancel"):
		finish()
