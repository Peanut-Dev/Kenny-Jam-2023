extends CharacterBody2D

@export var speed: int = 0

# get the keys the player is facing then turns it into directional velocity
func get_input():
	var inputDirection: Vector2 = Input.get_vector("left", "right", "up", "down");
	set_velocity(inputDirection * speed);
	
	print(inputDirection);

# calls get input and handles moving the player
func _physics_process(delta):
	get_input();
	move_and_slide();
