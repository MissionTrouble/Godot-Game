extends Sprite



signal forward_change
var changing = false


func _ready():
	get_parent().text = "JUMP: " + str(OS.get_scancode_string(Save.controls["jump"]))


func _input(event):
	if event is InputEventKey and event.pressed and changing == true:
		if(event.scancode == KEY_ESCAPE):
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").hide()
			changing = false
		else:
			print(event.scancode)
			Save.controls["jump"] = event.scancode
			get_parent().text = "JUMP: " + str(event.as_text())
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").hide()
			changing = false


	if event is InputEventMouseButton \
	and get_rect().has_point(to_local(event.position)) \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and get_rect().has_point(to_local(event.position)):
		get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").show()
		changing = true
		emit_signal("forward_change")
		
