extends Area2D

var can_pick_up = false
# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the areas "body entered" signal to player movement
	connect("body_entered",_on_body_entered)
	connect("body_exited", _on_body_exited)
	
func _on_body_entered(body):
	# Check if the body is the player and enable item pickup
	if body.is_in_group("Player"): # Make sure your player node is in the 'Player' group
		can_pick_up = true
		print("entered zone")

func _on_body_exited(body):
	# Check if player leaves the area
	if body.is_in_group("Player"):
		can_pick_up=false
		print("left zone")

func _on_Area2D_input_event(view, event, shape_idx):
	# Check if event is a mouse button and if so pick up item
	if Input.is_action_pressed('interact') and can_pick_up:
		print("PICK OBJECT")
		emit_signal("item_picked_up")
		
		# Call the insert function
	
