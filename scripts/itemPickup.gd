extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", _on_Item_Interact)


func _on_Item_Interact(view, event, shape_idx):
	var regionScript = get_parent()
	# Checks the input is mouse click on item
	if Input.is_action_pressed('interact') and regionScript.can_pick_up:
		print("PICK OBJECT")
		emit_signal("item_picked_up")
