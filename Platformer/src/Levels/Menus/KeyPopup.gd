extends Popup


# Declare member variables here. Examples:
# var a = 24536
# var b = "text"
export var offset = Vector2.ZERO



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	var cam = get_parent()
	if(cam != null):
		rect_global_position = cam.rect_global_position
