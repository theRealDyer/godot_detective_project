extends Control

var finished := false

func _ready():


	
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("vhs glitch")
	await get_tree().create_timer(4).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _unhandled_input(event): # calls finish() when ...???
	if event.is_action_pressed("ui_cancel")	or event.is_action_pressed("ui_accept"):
		finish()
