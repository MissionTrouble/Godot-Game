extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	var os = OS.get_screen_size()
	get_parent().get_node("Box").scale = Vector2(3,3)
	print("done")



func _process(delta):
	var pos = get_parent().get_node("camera").get_camera_position()
	var os = OS.get_screen_size()
	position = Vector2(pos.x,pos.y+os.y/3)
	if(Input.is_action_just_pressed("Next")):
		print("fdsa")
		hide()
	
