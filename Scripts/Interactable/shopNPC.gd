# Handles the shop NPC
extends Interactable


# Handles interaction with the shop
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/UI/Shop.tscn")
