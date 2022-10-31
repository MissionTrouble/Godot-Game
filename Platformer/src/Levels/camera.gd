extends Camera2D

func _process(delta):
	make_current()
	var x = get_camera_position().x
	var y = get_camera_position().y
	var pos = get_node("../player").global_position
#	if(pos.x - x > 400):
#		x = pos.x - 400
#	if(x - pos.x > 400):
#		x = pos.x + 400
#	if(pos.y - y > 175):
#		y = pos.y - 175
#	if(y - pos.y > 175):
#		y = pos.y + 175
#	if(x<960):
#		x = 960
#	if(y>540):
#		y = 540
#	if(get_camera_position().x-pos.x < 10 or get_camera_position().x-pos.x > -10):
#		x = x
	position = Vector2(pos)
