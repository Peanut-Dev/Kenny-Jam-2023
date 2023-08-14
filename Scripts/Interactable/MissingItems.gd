# Handles missing items being found
extends Interactable

# Vars
# Export vars
@export var jobID : int;

func _ready():
	self.body_entered.connect(InRange);
	self.body_exited.connect(LeavesRange);
	
	if JobData.currentJob != jobID:
		hide()
	else:
		JobData.ItemNode = self

func _process(delta):
	if isInRange == true and JobData.currentJob == jobID and Input.is_action_just_pressed("interact"):
		print("Player found item!")
		
		var result = get_tree().change_scene_to_file("res://Scenes/CompletionScreen.tscn");
		if result != OK:
			print("Scene load failed!");
			return;
		else:
			print("Scene load was a success!");
