extends CharacterBody2D

# Vars
# Export vars
@export var speed: int = 0
@export var tileSize = 16
# Other
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}


# On ready, snap player to grid
func _ready():
	position = position.snapped(Vector2.ONE * tileSize)
	position += Vector2.ONE * tileSize/2

# If player presses movement key, trigger move func
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

# Moves the player based on the tilemap and input
func move(dir):
	position += inputs[dir] * tileSize
