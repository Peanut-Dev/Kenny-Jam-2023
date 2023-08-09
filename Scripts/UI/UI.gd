# Script that handles the settings
extends Control

# Vars
# Nodes
@onready var MasterVolumeLabel = get_node("%MasterVolumeLabel")
@onready var MasterVolumeSlider = get_node("%MasterVolumeSlider")
@onready var AmbienceVolumeLabel = get_node("%AmbienceVolumeLabel")
@onready var AmbienceVolumeSlider = get_node("%AmbienceVolumeSlider")

# Sets all the nodes values when first loading up settings
func _ready():
	# Master volume
	NodeSetup("Master", MasterVolumeLabel, MasterVolumeSlider)
	NodeSetup("Ambience", AmbienceVolumeLabel, AmbienceVolumeSlider)

# Function for setting up volume nodes. called from the _ready function
func NodeSetup(AudioBusName, VolumeLabel, VolumeSlider):
	VolumeLabel.set_text(AudioBusName + " volume: " + str(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(AudioBusName)) + 50))
	VolumeSlider.set_value(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(AudioBusName)))

# Function for changing volume
func ChangeVolume(AudioBusName, NewVolume):
	if NewVolume <= -50:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(AudioBusName), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(AudioBusName), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(AudioBusName), NewVolume)

# Function for changing master volume
func MasterVolumeSliderChanged(NewVolume):
	ChangeVolume("Master", NewVolume)
	
	MasterVolumeLabel.set_text("Master volume: " + str(NewVolume + 50))

# Function for changing Ambience volume
func AmbienceVolumeSliderChanged(NewVolume):
	ChangeVolume("Ambience", NewVolume)
	
	AmbienceVolumeLabel.set_text("Ambience volume: " + str(NewVolume + 50))

# Function for returning the player back to the tavern
func Return():
	get_tree().change_scene_to_file("res://Scenes/Levels/Tavern.tscn")
