# Handles interacting with the job board
extends Interactable

# Vars
# Nodes
@onready var jobListingsUI : Control = get_node("%JobListingsUI");
@onready var jobListButtons : VBoxContainer = jobListingsUI.get_node("%JobListButtons")

# Constantly checks if the player is in range and presses F
# Sets the job button names in the job listing UI
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		get_tree().paused = !get_tree().paused
		
		print("Player interacted with " + name);
		
		jobListingsUI.visible = !jobListingsUI.visible;
		
		var i = 0
		for button in jobListButtons.get_children():
			print(button.name)
			print(JobData.itemData["Jobs"][i])
			
			button.set_text(JobData.itemData["Jobs"][i]["Name"])
			
			i += 1
		
		jobListButtons.get_child(0).grab_focus()
