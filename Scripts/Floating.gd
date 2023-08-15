# Script that makes control nodes float up and down
extends Control

# Vars
var DirectionBool = false
# Export var
@export var FloatSpeed : float = 0.2
@export var TimerWaitTime : float = 0.5


func _ready():
	get_node("SwitchTimer").set_wait_time(TimerWaitTime)
	get_node("SwitchTimer").start()

func _physics_process(delta):
	if DirectionBool == true:
		position.y += FloatSpeed
	else:
		position.y -= FloatSpeed


func TimerTimeout():
	DirectionBool = !DirectionBool
