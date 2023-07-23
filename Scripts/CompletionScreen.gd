# Controls the completion screen
extends Control

# Vars
# Nodes
@onready var jobCompletedLabel = get_node("%JobCompleted")


# On ready set the label nodes to be the right ones
func _ready():
	jobCompletedLabel.set_text("Job completed: " + JobData.itemData["Jobs"][JobData.currentJob - 1]["Name"])

# When the continue button is pressed, continue to the town
func continueButtonPressed():
	var result = get_tree().change_scene_to_file("res://Scenes/Levels/Town.tscn");
	if result != OK:
		print("Scene load failed!");
		return;
	else:
		print("Scene load was a success!");
