extends Area2D

signal item_interact

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", _on_Item_Interact)


func _on_Item_Interact(view, event, shape_idx):
	var regionScript = get_parent()
	# Checks the input is mouse click on item
	if Input.is_action_pressed('interact') and regionScript.can_pick_up:
		print("PICK OBJECT")
		# Get the item meta data
		var item_info = regionScript.get_meta("Information") as ItemData
		emit_signal("item_interact", item_info)
