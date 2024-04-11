extends CanvasLayer

@onready var inventory = $PlayerInventory

func _ready():
	# Default to closed inventory
	process_mode = Node.PROCESS_MODE_ALWAYS
	inventory.Close()

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		# If inventory button pressed, toggle Inventory
		if inventory.isOpen:
			inventory.Close()
			
		else:
			inventory.Open()
