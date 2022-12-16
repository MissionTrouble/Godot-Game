extends Sprite



var changing = false
var index = 0
var add = false

func _ready():
		$LeftArrow.connect("left",self, "left")
		$RightArrow.connect("right",self, "right")
		$KEY.text = OS.get_scancode_string(Save.controls["options"][index])
		updateArrows()

func left():
	index -= 1
	$KEY.text = OS.get_scancode_string(Save.controls["options"][index])
	updateArrows()
	pass
func right():
	index += 1
	$KEY.text = OS.get_scancode_string(Save.controls["options"][index])
	updateArrows()
	pass

func updateArrows():
	if $KEY.text == OS.get_scancode_string(Save.controls["options"][0]):
		$LeftArrow.visible = false
	else:
		$LeftArrow.visible = true
	if $KEY.text == OS.get_scancode_string(Save.controls["options"][Save.controls["options"].size()-1]):
		$RightArrow.visible = false
	else:
		$RightArrow.visible = true

func _process(delta):
	if get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible == false:
		changing = false
func _input(event):
	if event is InputEventKey and event.pressed and changing == true:
#		if(event.scancode == KEY_ESCAPE):
#			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = false
#			changing = false
#		el
		if add:
			Save.controls["options"].resize(Save.controls["options"].size()+1)
			index = Save.controls["options"].size()-1
			Save.controls["options"][Save.controls["options"].size()-1] = event.scancode
			$KEY.text = event.as_text()
			updateArrows()
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = false
			changing = false
		else:
			Save.controls["options"][0] = event.scancode
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


func _on_ADD_pressed():
	add = true
	changing = true
	get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").visible = true
	pass # Replace with function body.


func _on_DELETE_pressed():
	if Save.controls["options"].size() >1:
		Save.controls["options"].remove(index)
		if index >= Save.controls["options"].size():
			index -= 1
			$KEY.text = OS.get_scancode_string(Save.controls["options"][index])
		elif index >= 0:
	#		index -= 1
			$KEY.text = OS.get_scancode_string(Save.controls["options"][index])
		updateArrows()
		pass # Replace with function body.
