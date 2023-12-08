extends CharacterBody2D

@export var speed = 200 # Sets how fast player moves [pixels/sec]
var screen_size # Size of game window

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func start(pos):
	# Sets initial player positon
	position = pos
	show()
	
func get_input():
	# Gets the input buttons and makes a velocity
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed


func _physics_process(delta):
	get_input()
	move_and_collide(velocity*delta)
	
	# Starts/stops animations
	if velocity.length() > 0:
		# Ensure that the velocity is the same diagonally as on grid
		velocity = velocity.normalized()  * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# Check direction of movenent and play correct animation
	if velocity.y!=0: # UpDown movement
		# Set animation to up down animation
		$AnimatedSprite2D.animation = 'walkUD'
		$AnimatedSprite2D.flip_h = false # Dont flip along x=0
		#  Only flip animation if moving down
		$AnimatedSprite2D.flip_v = velocity.y>0 
		
	elif velocity.x!=0: # RL movement
		# Set correct animation
		$AnimatedSprite2D.animation = 'walkRL'
		$AnimatedSprite2D.flip_v = false
		# Only flip if moving left
		$AnimatedSprite2D.flip_h = velocity.x<0

	# Clamp the character to the screen
	var new_pos = position.clamp(Vector2.ZERO, screen_size)
	if new_pos != position:
		position=new_pos
