# Handles interacting with the job board
extends Interactable

# Vars
# Nodes
@onready var jobListingsUI : Control = get_node("%JobListingsUI");
@onready var jobListButtons : VBoxContainer = jobListingsUI.get_node("%JobListButtons");

# Constantly checks if the player is in range and presses F
# Sets the job button names in the job listing UI
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		get_tree().paused = !get_tree().paused;
		
		print("Player interacted with " + name);
		
		jobListingsUI.visible = !jobListingsUI.visible;
		
		randomize()
		for button in jobListButtons.get_children():
			await SelectJob(button)
			
			button.pressed.connect(jobSelected);
			print("Signal connected");
		
		jobListButtons.get_child(0).grab_focus();

# Method that is called when selecting a job for each button
func SelectJob(button):
	var i = randi() % JobData.itemData["Jobs"].size()
	
	if JobData.itemData["Jobs"][i]["Completed"] == true:
		SelectJob(button)
		return
	
	print(button.name);
	print(JobData.itemData["Jobs"][i]);
	
	button.set_text(JobData.itemData["Jobs"][i]["Name"]);
	button.set_meta("jobID", JobData.itemData["Jobs"][i]["ID"]);


# When a button is pressed, save the selected job
func jobSelected():
	for button in jobListButtons.get_children():
		if button.is_pressed() == true:
			JobData.currentJob = button.get_meta("jobID");
	
	print("Job selected");
