# Handles the shop NPC
extends Interactable


# Handles interaction with the shop
func _process(delta):
	if isInRange == true and Input.is_action_just_pressed("interact"):
		pass
