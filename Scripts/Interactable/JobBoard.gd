# Handles interacting with the job board
extends Interactable

# Vars
@onready var jobListingsUI : Control = get_node("%JobListingsUI");

# Constantly checks if the player is in range and presses F
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		print("Player interacted with " + name);
		
		jobListingsUI.visible = !jobListingsUI.visible;
