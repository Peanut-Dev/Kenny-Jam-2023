# Script that handles the settings NPC
extends Interactable


# On player input, if in range move player to the settings menu
func _unhandled_key_input(event):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/UI/Settings.tscn")
