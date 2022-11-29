extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal menu(event)
signal options(event)
signal move_left(event)
signal move_right(event)
signal jump(event)
var jump
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventKey:
		if event.scancode == Save.controls["menu"] and !event.is_echo() and event.pressed:
			emit_signal("menu", event)
		if event.scancode == Save.controls["options"] and !event.is_echo() and event.pressed:
			emit_signal("options", event)
		if event.scancode == Save.controls["move_right"]:
			emit_signal("move_right", event)
		if event.scancode == Save.controls["move_left"]:
			emit_signal("move_left", event)
		if(event.scancode == Save.controls["jump"]):
			emit_signal("jump", event)
			if(event.pressed):
				jump = true
			else:
				jump = false
