extends Control

func _ready():

	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/intro_jjgames_logo.tscn")
