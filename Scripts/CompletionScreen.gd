# Controls the completion screen
extends Control

# Vars
# Nodes
@onready var jobCompletedLabel : Label = get_node("%JobCompleted")
@onready var moneyEarnedLabel : Label = get_node("%MoneyEarned")
@onready var balanceLabel : Label = get_node("%Balance")
@onready var JobCompleteContainer : VBoxContainer = get_node("%JobComplete")
@onready var StoryTextContainer : VBoxContainer = get_node("%StoryTextContainer")
@onready var StoryTextLabel : Label = get_node("%StoryText")

# On ready set the label nodes to be the right ones.
# Display story text if the current job is a story job
func _ready():
	if JobData.itemData["Jobs"][JobData.currentJob - 1].has("StoryText") == true:
		print("Job is story job")
		StoryTextLabel.set_text(JobData.itemData["Jobs"][JobData.currentJob - 1]["StoryText"])
		StoryTextContainer.show()
	else:
		JobCompleteContainer.show()
	
	JobData.itemData["Jobs"][JobData.currentJob - 1]["Completed"] = true
	JobData.currentJob = 0;
	
	Global.Gold += JobData.itemData["Jobs"][JobData.currentJob - 1]["Reward"]
	print("Player balance is now: " + str(Global.Gold))
	
	jobCompletedLabel.set_text("Job completed: " + JobData.itemData["Jobs"][JobData.currentJob - 1]["Name"])
	moneyEarnedLabel.set_text("Money earned: " + str(JobData.itemData["Jobs"][JobData.currentJob -1]["Reward"]))
	balanceLabel.set_text("Balance: " + str(Global.Gold))

# When the continue button is pressed, continue to the town
func continueButtonPressed():
	if StoryTextContainer.visible == true:
		StoryTextContainer.hide()
		JobCompleteContainer.show()
		return
	
	var result = get_tree().change_scene_to_file("res://Scenes/Levels/Town.tscn");
	if result != OK:
		print("Scene load failed!");
		return;
	else:
		print("Scene load was a success!");
