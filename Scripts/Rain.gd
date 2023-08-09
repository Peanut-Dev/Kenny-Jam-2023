# Handles the rain animation in game
extends AnimatedSprite2D


# Rolls a random chance for there to be rain
func _ready():
	randomize()
	
	var RandomNumber = randi() % 100 + 1
	print("Rain number rolled: " + str(RandomNumber))
	
	if RandomNumber >= 10 and RandomNumber <= 20:
		print("Rain")
		show()
		play()
		get_node("RainAmbience").play()
	else:
		hide()
