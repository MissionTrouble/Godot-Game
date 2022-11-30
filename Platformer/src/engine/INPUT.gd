extends Node


signal menu(event)
signal options(event)
signal move_left(event)
signal move_right(event)
signal jump(event)
var jump = false
var left = false
var right = false
var expirimental = true


func _input(event):
	if event is InputEventKey:
			for menu in Save.controls["menu"]:
				if event.scancode == menu and !event.is_echo() and event.pressed:
					emit_signal("menu", event)

#		if expirimental:
			for options in Save.controls["options"]:
				if event.scancode == options and !event.is_echo() and event.pressed:
					emit_signal("options", event)
#		elif event.scancode == Save.controls["options"] and !event.is_echo() and event.pressed:
#			emit_signal("options", event)

#		if expirimental:
			for RIGHT in Save.controls["move_right"]:
				if event.scancode == RIGHT:
					emit_signal("move_right", event)
					if(event.pressed):
						right = true
						print("rt")
					else:
						right = false
						print("rf")
					
#		elif event.scancode == Save.controls["move_right"]:
#			emit_signal("move_right", event)
#			if(event.pressed):
#				right = true
#			else:
#				right = false
	
#		if expirimental:
			for LEFT in Save.controls["move_left"]:
				if event.scancode == LEFT:
					emit_signal("move_left", event)
					if(event.pressed):
						left = true
					else:
						right = false
#		elif event.scancode == Save.controls["move_left"]:
#			emit_signal("move_left", event)
#			if(event.pressed):
#				left = true
#			else:
#				left = false

#		if expirimental:
			for JUMP in Save.controls["jump"]:
				if(event.scancode == JUMP):
					emit_signal("jump", event)
					if(event.pressed):
						jump = true
					else:
						jump = false
#		elif event.scancode == Save.controls["jump"]:
#			emit_signal("jump", event)
#			if(event.pressed):
#				jump = true
#			else:
#				jump = false
