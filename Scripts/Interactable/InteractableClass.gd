# Class for interactable nodes
class_name Interactable extends Node2D

# Vars
var isInRange = false;
# Export vars
@export var interactText : String;
# Nodes
@onready var label : Label = get_node("Label");


func _ready():
	self.body_entered.connect(InRange);
	self.body_exited.connect(LeavesRange)

# When player is in range, give prompt to interact
func InRange(body : CharacterBody2D):
	if body.name == "Player":
		print("Player in range");
		
		label.set_text("Press F to " + interactText);
		isInRange = true;

# When player leaves range, remove prompt
func LeavesRange(body : CharacterBody2D):
	if body.name == "Player":
		print("Player left range")
		
		label.set_text("");
		isInRange = false;
