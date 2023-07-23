extends CharacterBody2D

# Vars
# Nodes
@onready var jobDescriptionUI : Control = get_node("%JobDescription")
@onready var ray : RayCast2D = $RayCast2D
@onready var runningTimer : Timer = $RunningTimer
# Export vars
@export var tileSize = 16

# On ready, snap player to grid
func _ready():
	position = position.snapped(Vector2.ONE * tileSize) - Vector2.ONE * tileSize/2;

# If player presses movement key, trigger move func.
# Waits 0.2 seconds in case player is holding down a movement key and wants to move automatically
func _physics_process(delta):
	if Input.is_action_pressed("up") and runningTimer.is_stopped() == true:
		move(Vector2.UP);
		runningTimer.start()
	if Input.is_action_pressed("down") and runningTimer.is_stopped() == true:
		move(Vector2.DOWN);
		runningTimer.start()
	if Input.is_action_pressed("left") and runningTimer.is_stopped() == true:
		move(Vector2.LEFT);
		runningTimer.start()
	if Input.is_action_pressed("right") and runningTimer.is_stopped() == true:
		move(Vector2.RIGHT);
		runningTimer.start()
	
	if Input.is_action_just_pressed("JobInfo"):
		if JobData.currentJob == 0:
			return
		
		jobDescriptionUI.visible = !jobDescriptionUI.visible
		
		jobDescriptionUI.get_node("%DescriptionLabel").set_text(JobData.itemData["Jobs"][JobData.currentJob - 1]["Description"])

# Check if the player is about to make an illegal move (Collision)
# If move is legal, move the player by one tile
func move(dir: Vector2):
	ray.target_position = dir * tileSize;
	ray.force_raycast_update();
	
	if !ray.is_colliding():
		position += dir * tileSize;
