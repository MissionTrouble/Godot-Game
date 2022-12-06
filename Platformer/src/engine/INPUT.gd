extends Node


signal menu(event)
signal options(event)
signal move_left(event)
signal move_right(event)
signal jump(event)
var jump = false
var left = false
var right = false



func _input(event):
	if event is InputEventKey:
			for menu in Save.controls["menu"]:
				if event.scancode == menu and !event.is_echo() and event.pressed:
					emit_signal("menu", event)


			for options in Save.controls["options"]:
				if event.scancode == options and !event.is_echo() and event.pressed:
					emit_signal("options", event)

			for RIGHT in Save.controls["move_right"]:
				if event.scancode == RIGHT:
					emit_signal("move_right", event)
					if(event.pressed):
						right = true
					else:
						right = false
					

			for LEFT in Save.controls["move_left"]:
				if event.scancode == LEFT:
					emit_signal("move_left", event)
					if(event.pressed):
						left = true
					else:
						left = false
						
			for JUMP in Save.controls["jump"]:
				if(event.scancode == JUMP):
					if(event.pressed):
						jump = true
					else:
						jump = false
					emit_signal("jump", event)
					
