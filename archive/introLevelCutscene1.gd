extends Node2D

var finished := false # for use when exiting level

func _ready():
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("fade_in_text")
	await get_tree().create_timer(5).timeout
	$AnimationPlayer.play("fadeOutText_cameraPan")
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://scenes/introLevel.tscn")

func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/introLevel.tscn")

func _unhandled_input(event): # calls finish when Esc is pressed
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("ui_accept"):
		finish()
