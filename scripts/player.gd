extends Area2D
# TESTING
@export var speed = 400 # Sets how fast player moves [pixels/sec]
var screen_size # Size of game window

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # Player movement vector
	if Input.is_action_pressed("walk_right"):
		velocity.x+=1
	if Input.is_action_pressed("walk_left"):
		velocity.x-=1
	if Input.is_action_pressed("walk_forward"):
		velocity.y-=1
	if Input.is_action_pressed("walk_backward"):
		velocity.y+=1
		
	if velocity.length() > 0:
		# Ensure that the velocity is the same diagonally as on grid
		velocity = velocity.normalized()  * speed
		
	position+=velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size) # keeps player on the screen
	
