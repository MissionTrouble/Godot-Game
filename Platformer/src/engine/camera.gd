extends Camera2D


func _process(delta):
	make_current()
	if(get_parent().get_node("player") != null):
		var pos = get_parent().get_node("player").global_position
		position = Vector2(pos.x,pos.y)
