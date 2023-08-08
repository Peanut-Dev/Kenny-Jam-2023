# Script for handling the player closing their eyes
extends Panel

# Vars
# Nodes
@onready var WhisperAudio : AudioStreamPlayer = get_node("WhisperAudio")
@onready var VoiceWritingsLabel : Label = get_node("VoiceWritings")

# When the player presses the close eyes key, bring up the closed eyes node
func _unhandled_key_input(event):
	if event.is_action_pressed("CloseEyes"):
		visible = !visible
		print("Eyes closed: " + str(visible))
		
		WhisperAudio.playing = !WhisperAudio.playing
		
		if WhisperAudio.playing == true:
			VoiceWritings()
		else:
			VoiceWritingsLabel.set_text("")

# Function for handling voice writings
func VoiceWritings():
	await get_tree().create_timer(1.5).timeout
	VoiceWritingsLabel.set_text(JobData.itemData["Jobs"][JobData.currentJob - 1]["Hint"])
