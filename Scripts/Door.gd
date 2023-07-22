# Handles the door object. Moves the player to a new scene
extends Area2D


# Vars
# Export vars
@export_file("*.tscn") var scene;


# On body entering, check if its the player.
# If its the player, change to the next scene saved in the scene var
func onBodyEntered(body : CharacterBody2D):
	if body.name == "Player":
		print("Attempting to change scene...");
		print(scene);
		
		var result = get_tree().change_scene_to_file(scene);
		if result != OK:
			print("Scene load failed!");
			return;
		else:
			print("Scene load was a success!");
