extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal left

#func _process(delta):
#	var p = connect("/root/Main",self,"prin")
#
#func prin():
#	print(visible)
#	print(get_rect().has_point(to_local(event.position)))
func _input(event):
	print(visible)
	if event is InputEventMouseButton \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and visible \
	and get_rect().has_point(to_local(event.position)):
#		print("left")
		emit_signal("left")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
