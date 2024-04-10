extends Panel

# Get child Vbox

# Called when the node enters the scene tree for the first time.
func _ready():
	var vbox = get_child(0)
	visible=false
	
	# Connect vbox size change to panel
	connect("resized", _on_VBoxContainer_size_changed)
	# ensure we start with the correct size
	_on_VBoxContainer_size_changed()

func _on_VBoxContainer_size_changed() -> void:
	var vbox = get_child(0)
	
	# Update panel's min size to match VboxContainer
	size = vbox.size

func _input(event):
	if event.is_action_pressed('interact'):
		visible=false # Hide panel with any click

