extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false
	
func _input(event):
	if event.is_action_pressed('interact'):
		visible=false # Hide panel with any click

func on_Body_Exited(body):
	visible=false
