extends Control

@export_file("*.json") var dialoguePath: String;
@export var textSpeed = 0.05;
@onready var textBox: RichTextLabel = get_node("DialogueBox/Text");

var dialogue: Array = [];

var currentDialogue = 0;
var finished = false;

func _ready():
	get_tree().set_pause(true);
	
	dialogue = getDialogue();
	assert(dialogue.size() > 0, "Dialogue not found");
	nextDialogue();

func _process(delta):
	if (Input.is_action_just_pressed("interact")):
		if (!finished):
			textBox.visible_characters = len(textBox.text);
			return;
		
		nextDialogue();
		
		if currentDialogue >= dialogue.size():
			get_tree().set_pause(false);

func getDialogue() -> Array:
	assert(FileAccess.file_exists(dialoguePath), "Dialogue not found");
	
	var f: FileAccess = FileAccess.open(dialoguePath, FileAccess.READ);
	var output = JSON.parse_string(f.get_as_text());
	
	if typeof(output) == TYPE_ARRAY:
		return output;
		
	return [];

func nextDialogue() -> void:
	if (currentDialogue >= dialogue.size()):
		queue_free();
		return;
		
	finished = false;
	
	textBox.bbcode_text = dialogue[currentDialogue]["Text"];
	textBox.visible_characters = 0;
	
	while (textBox.visible_characters < len(textBox.text)):
		textBox.visible_characters += 1;
		await get_tree().create_timer(textSpeed).timeout;
	
	finished = true;
	currentDialogue += 1;
