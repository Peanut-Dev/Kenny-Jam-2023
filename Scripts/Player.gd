extends CharacterBody2D

# Vars
# Nodes
@onready var ray : RayCast2D = $RayCast2D
# Export vars
@export var tileSize = 16

# On ready, snap player to grid
func _ready():
	position = position.snapped(Vector2.ONE * tileSize) - Vector2.ONE * tileSize/2;

# If player presses movement key, trigger move func
func _unhandled_input(event):
	if (event.is_action_pressed("up")):
		move(Vector2.UP);
	if (event.is_action_pressed("down")):
		move(Vector2.DOWN);
	if (event.is_action_pressed("left")):
		move(Vector2.LEFT);
	if (event.is_action_pressed("right")):
		move(Vector2.RIGHT);

# Check if the player is about to make an illegal move (Collision)
# If move is legal, move the player by one tile
func move(dir: Vector2):
	ray.target_position = dir * tileSize;
	ray.force_raycast_update();
	
	if !ray.is_colliding():
		position += dir * tileSize;
