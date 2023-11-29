extends Control

func _ready():

	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6).timeout

