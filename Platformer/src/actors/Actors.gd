extends KinematicBody2D

var double_jump_used: = false

func on_floor() -> bool:
	var ground: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle() == 0):
			ground = true
			double_jump_used = false
	return ground

func on_wall() -> bool:
	var wall: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle()*180/PI > 89.9 and collision.get_angle()*180/PI < 90.1):
			wall = true
			double_jump_used = false
	return wall

func on_roof() -> bool:
	var roof: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle()*180/PI > 189.9 and collision.get_angle()*180/PI < 190.1):
			roof = true
	return roof
	
