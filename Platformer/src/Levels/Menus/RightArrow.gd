extends Sprite



signal right



func _input(event):
	if event is InputEventMouseButton \
	and get_rect().has_point(to_local(event.position)) \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and visible:
		emit_signal("right")


