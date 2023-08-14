# Script that controls the shop
extends Control

# Vars
@onready var PurchaseResultLabel : Label = get_node("%PurchaseResultLabel")
@onready var GoldAmountLabel : Label = get_node("%GoldAmount")


func _ready():
	UpdateGold()

# Function called when the current gold amount is getting updated
func UpdateGold():
	GoldAmountLabel.set_text("Current gold amount: " + str(Global.Gold))

# Function called when a purchase button is pressed
func Purchase(Upgrade : String):
	var UpgradePrice : int = Global[Upgrade]["Price"]
	var OwnedStatus : bool = Global[Upgrade]["Owned"]
	
	# Debug lines
	print("Upgrade name: " + Upgrade)
	print("Upgrade price: " + str(UpgradePrice))
	print("Owned status: " + str(OwnedStatus))
	
	
	# Check if the user has enough money
	if Global.Gold < UpgradePrice:
		print("Not enough money!")
		PurchaseResultLabel.set_text("Not enough money!")
	else:
		print("User has enough money!")
		PurchaseResultLabel.set_text("Purchase successful!")
		
		Global.Gold -= UpgradePrice
		print("Updated user gold amount: " + str(Global.Gold))
		
		Global[Upgrade]["Owned"] = true
	
	UpdateGold()

# Function called when the return button is pressed
func ReturnButtonPressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Tavern.tscn")
