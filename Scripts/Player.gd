extends CharacterBody2D

# Vars
# Nodes
@onready var ray : RayCast2D = $RayCast2D
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

# Check if the player is about to make an illegal move (Collision)
# If move is legal, move the player by one tile
func move(dir):
	ray.target_position = inputs[dir] * tileSize
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tileSize
