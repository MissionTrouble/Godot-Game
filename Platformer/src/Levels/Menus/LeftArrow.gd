extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal left



func _input(event):
	if event is InputEventMouseButton \
	and get_rect().has_point(to_local(event.position)) \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and visible:
		emit_signal("left")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
