extends Node2D

var finished := false # for use when exiting level
var can_move := false # Control variable for player movement and camera tracking

func _ready():	
	# ----- cutscene begin -----
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("fade_in_text")
	await get_tree().create_timer(3).timeout
	$BackgroundAmbience.play()  # Start playing the background audio
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play("fadeOutText_cameraPan")
	await get_tree().create_timer(10).timeout
	$AnimationPlayer.play("letterbox_withdraw")
	await get_tree().create_timer(2).timeout
	# ----- cutscene end -----
	can_move = true # Now the player can move and the camera can track

func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _unhandled_input(event): # calls finish when Esc is pressed
	if event.is_action_pressed("ui_cancel"):
		finish()
	
