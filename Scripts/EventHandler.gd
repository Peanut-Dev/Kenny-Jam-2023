# Script that handles events
extends Node2D

# Vars
@onready var DialogueBoxScene = preload("res://Scenes/UI/Textbox.tscn")
@export var UINode : Control

# Function that handles event calling
func EventHandler(Body : Node2D, Event : String, DialoguePath : String = ""):
	match Event:
		"DiamondEvent":
			if JobData.currentJob != 7:
				return
			
			print("Diamond event")
			
			var DialogueBox = DialogueBoxScene.instantiate()
			DialogueBox.dialoguePath = DialoguePath
			UINode.add_child(DialogueBox)
		_:
			print("Event not found!")
