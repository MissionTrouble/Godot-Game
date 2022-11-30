extends Camera2D

func _process(delta):
	make_current()
	var x = get_camera_position().x
	var y = get_camera_position().y
	var pos = get_node("../player").global_position
	position = Vector2(pos)
