extends Node2D

var speed = 100  # Speed of the movement in pixels per second
var window_offset = Vector2(200, 200)  # Initial offset for the window position

func _ready():
	# Set the initial position of the window
	DisplayServer.window_set_position(DisplayServer.get_main_window_id(), window_offset)

func _process(delta):
	var direction = Vector2()
	
	# Check for input and set the direction
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalize the direction to have a consistent speed in all directions
	direction = direction.normalized()
	
	# Move the node
	position += direction * speed * delta
	
	# Move the window along with the node
	var new_window_position = DisplayServer.window_get_position(DisplayServer.get_main_window_id()) + direction * speed * delta
	DisplayServer.window_set_position(DisplayServer.get_main_window_id(), new_window_position)
