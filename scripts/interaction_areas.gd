extends Area2D

@onready var ui_layer = $"../UILayer/InfoPanel"
@onready var inventory: InventoryData = preload("res://inventory/inventory.tres")


var can_pick_up = false
# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the areas "body entered" signal to player movement
	connect("body_entered",_on_body_entered)
	connect("body_exited", _on_body_exited)

func _input(event):
	if can_pick_up and event.is_action_pressed('pickup'):
		# Press e to pick up item if player in the interaction area
		inventory.insert(get_meta("Information")) # Insert Item data
		inventory.updated.emit() # Update GUI
		queue_free()
		
func _on_body_entered(body):
	# Check if the body is the player and enable item pickup
	if body.is_in_group("Player"): # Make sure your player node is in the 'Player' group
		can_pick_up = true
		print("entered zone")

func _on_body_exited(body):
	# Check if player leaves the area
	if body.is_in_group("Player"):
		can_pick_up=false
		ui_layer.visible = false
		print("left zone")
		
func _display_Item_Info(item_info):
	# Show resource info on item interact
	# Access the ui for item interaction
	var name_label = ui_layer.get_node("Panel/Text/ItemName") 
	var description_label = ui_layer.get_node("Panel/Text/ItemDescription")
	var item_image = ui_layer.get_node("Panel/Sprite/Image")
	
	# Set the name and description text to that which is "in t"he item resource
	name_label.text = item_info.name
	description_label.text = item_info.description
	
	# Set image to item image if it exists
	if item_info.texture:
		item_image.texture = item_info.texture
	

	# Show UI elements if they are not yet visible
	ui_layer.visible = true
	name_label.show()
	description_label.show()

