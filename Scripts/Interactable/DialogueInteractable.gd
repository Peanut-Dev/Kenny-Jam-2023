extends Interactable

@export_file("*.json") var dialoguePath: String;
@export var textSpeed = 0.05;
@onready var dialogueBoxScene = load("res://Scenes/UI/Textbox.tscn");

# i WILL change this eventually
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact") and not get_tree().get_root().get_node("Dialogue"):
		var dialogueBox = dialogueBoxScene.instantiate();
		dialogueBox.dialoguePath = dialoguePath;
		get_tree().get_root().add_child(dialogueBox);
