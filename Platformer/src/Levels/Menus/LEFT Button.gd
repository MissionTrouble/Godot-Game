extends Sprite



var changing = false


func _ready():
	get_parent().text = "LEFT: " + str(OS.get_scancode_string(Save.controls["move_left"][0]))



func _input(event):
	if event is InputEventKey and event.pressed and changing == true:
		if(event.scancode == KEY_ESCAPE):
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = false
			changing = false
		else:
			Save.controls["move_left"][0] = event.scancode
			get_parent().text = "LEFT: " + str(event.as_text())
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = false
			changing = false


	if event is InputEventMouseButton \
	and get_rect().has_point(to_local(event.position)) \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and get_rect().has_point(to_local(event.position)) \
	and get_parent().get_parent().get_parent().get_parent().get_parent().current_tab == 1 \
	and get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible == false:
		get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = true
		changing = true
	
	if event is InputEventMouse \
	and get_rect().has_point(to_local(event.position)):
		set_texture(preload("res://.import/change-pressed.png-706fc8a1782773a468bbf0e3b3c62606.stex"))
	else:
		set_texture(preload("res://.import/change.png-28510be00ee8cd96d1decfe5c69e5062.stex"))
