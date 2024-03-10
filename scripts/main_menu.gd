extends Control

func _ready():

	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6).timeout



func _on_button_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/GodotCredits.tscn")


func _on_button_begin_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
