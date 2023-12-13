extends Node

@export var table_scene: PackedScene
@export var NumTables = 3
var screen_size = Vector2()# Size of game window
var placed_tables = [] # Keep track of placed tables
var player_start_pos = Vector2()

var finished := false # for use when exiting level

func ValidPos(pos, table):
	var col_shape = table.get_node("CollisionShape2D")
	var shape = col_shape.shape
	
	var table_size
	if shape is RectangleShape2D:
		table_size = shape.extents * 2 # Estimate size of table 
		
	# Check table position compared to player position
	if pos.distance_to(player_start_pos)<table_size.x:
		return false
	
	# Check against other tables
	for existing_table in placed_tables:
		if existing_table.position.distance_to(pos)<table_size.x:
			return false
			
	return true

func MakeTables(NumTables):
	# Get screen size
	screen_size = get_viewport().size
	player_start_pos = $StartPosition.position
	
	# Make N tables randomly around the map
	for i in range(NumTables):
	# Make instance	
		var table = table_scene.instantiate()
		
		var valid_pos = false
		var attempts = 0
		# Check for valid positions
		while not valid_pos and attempts<10:
			# Randomise position on map
			var rand_x = randf_range(50, screen_size.x-50)
			var rand_y = randf_range(50, screen_size.y-50)
			var potenial_pos = Vector2(rand_x, rand_y)
			
			if ValidPos(potenial_pos, table):
				valid_pos = true		
				table.position = Vector2(rand_x, rand_y)
				add_child(table)
				placed_tables.append(table)
			attempts+=1
			
		if attempts >=10:
			print("Failed to place a table after 10 attempts")
			
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)
	MakeTables(NumTables)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func finish(): # finishes the scene and moves to the next one
	if not finished:
		finished = true
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _unhandled_input(event): # calls finish when Esc is pressed
	if event.is_action_pressed("ui_cancel"):
		finish()
