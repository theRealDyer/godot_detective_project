extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false


func _input(event):
	if event.is_action_pressed('interact'):
		visible=false # Hide panel with any click


'''
Following function wont work atm, not sure why but will come back later
'''
func _on_Body_Exited(body):
	print("ESCAPED")
	visible=false
