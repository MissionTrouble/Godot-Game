extends Camera2D
var dead = false;
func _ready():
	print(OS.get_screen_size())

func _process(delta):
	make_current()
	var x = get_camera_position().x
	var y = get_camera_position().y
	var screen = OS.get_screen_size()
	if(get_parent().get_node("player") != null):
		var pos = get_parent().get_node("player").global_position
		if(pos.x<screen.x/2):
			pos.x = screen.x/2
		if(pos.y>screen.y*0.72):
			pos.y = screen.y*0.72
		position = Vector2(pos.x,pos.y)
		print(position)
		
	else:
		dead = true;
		position = Vector2(x,y)
