extends Camera2D

@onready var background: Sprite2D = get_node("../BackgroundImage")  # Use get_node with the correct relative path

func _ready():

	var backgroundSize = background.texture.get_size() * background.scale
	# Set camera limits.
	limit_left = 0
	limit_top = 0
	limit_right = backgroundSize.x
	limit_bottom = backgroundSize.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# currently set up for introLevel cutscene, so wiill need to amend to cover all cutscenes in any levels
	if get_node("/root/introLevel").can_move:
		pass









