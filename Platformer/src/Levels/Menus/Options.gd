extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var offset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.

func _on_Exit_pressed():
	pass # Replace with function body.
	
func _process(delta):
	var cam = get_parent().get_node("camera")
	if(cam != null):
		rect_global_position = cam.get_camera_position()-Vector2(offset)

func _on_CheckButton_toggled(button_pressed):
	Settings.TIMER = button_pressed
	pass # Replace with function body.


func _on_CheckButton2_toggled(button_pressed):
	Settings.COINS = button_pressed



func _on_CheckButton3_toggled(button_pressed):
	Settings.DEATHS = button_pressed
	pass # Replace with function body.


func _on_EXIT_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	pass # Replace with function body.
