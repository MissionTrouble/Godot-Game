extends Popup



export var offset = Vector2.ZERO


func _process(delta):
	var cam = get_parent()
	if(cam != null):
		rect_global_position = cam.rect_global_position


func _on_Button_pressed():
	visible = false
	get_parent().get_changing = false
