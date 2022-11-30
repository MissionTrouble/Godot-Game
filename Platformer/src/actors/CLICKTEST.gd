extends Sprite



func _input(event):
	if event is InputEventMouseButton \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and get_rect().has_point(to_local(event.position)):
			print("clicked on sprite")

