extends Node2D

var finished := false


func _ready():
	$AnimationPlayer.play("fade_in_1")
	await get_tree().create_timer(17).timeout
	$AnimationPlayer.play("fade_out_1")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/introLevel.tscn")

func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/introLevel.tscn")

func _unhandled_input(event): # calls finish() when ...???
	if event.is_action_pressed("ui_cancel")	or event.is_action_pressed("ui_accept"):
		finish()
