extends Popup

export var offset = Vector2(800,400)

func _ready():
	update_buttons()

func update_buttons():
	$"TabContainer/Gameplay/MarginContainer/GridContainer/TIMER BUTTON".pressed = Save.settings["timerEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/COIN BUTTON".pressed = Save.settings["coinEnabled"] 
	$"TabContainer/Gameplay/MarginContainer/GridContainer/DEATH BUTTON".pressed = Save.settings["deathEnabled"]
	$TabContainer/SAVE/MarginContainer/GridContainer/AutoSave.pressed = Save.settings["autosave"] 
	$"TabContainer/INPUT/MarginContainer/GridContainer/JUMP LABEL".text = "JUMP: " + str(OS.get_scancode_string(Save.controls["jump"]))
	$"TabContainer/INPUT/MarginContainer/GridContainer/LEFT LABEL".text = "LEFT: " + str(OS.get_scancode_string(Save.controls["move_left"]))
	$"TabContainer/INPUT/MarginContainer/GridContainer/RIGHT LABEL".text = "RIGHT: " + str(OS.get_scancode_string(Save.controls["move_right"]))
	$"TabContainer/INPUT/MarginContainer/GridContainer/OPTIONS LABEL".text = "OPTIONS: " + str(OS.get_scancode_string(Save.controls["options"]))
	$"TabContainer/INPUT/MarginContainer/GridContainer/MENU LABEL".text = "MENU: " + str(OS.get_scancode_string(Save.controls["menu"]))
	pass


func _on_Exit_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	if(Save.settings["autosave"]):
		Save.save()


func _process(delta):
	var cam = get_parent().get_parent().get_node("camera")
	if(cam != null):
		rect_global_position = cam.get_camera_position()-offset


func _on_EXIT_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	Save.save_controls()
	Save.save_settings()
	if(Save.settings["autosave"]):
		Save.save()


func _on_Save_pressed():
	Save.save()
	update_buttons()


func _on_DeleteSave_pressed():
	var dir = Directory.new()
	dir.remove("user://save_file.save")
	Save.level_reset()
	Save.load_data()
	update_buttons()

	get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
	Engine.time_scale = Main.timeScale


func _on_Coin_toggled(button_pressed):
	Save.settings["coinEnabled"] = button_pressed


func _on_Death_toggled(button_pressed):
	Save.settings["deathEnabled"] = button_pressed


func _on_Timer_toggled(button_pressed):
	Save.settings["timerEnabled"] = button_pressed


func _on_RESET_pressed():
	var dir = Directory.new()
	dir.remove("user://settings_file.save")

	Save.load_settings()
	update_buttons()


func _on_AutoSave_toggled(button_pressed):
	Save.settings["autosave"] = button_pressed
	pass # Replace with function body.





func _on_CONTROLS_RESET_pressed():
	Save.controls = {"jump":KEY_W,
			"move_left":KEY_A,
			"move_right":KEY_D,
			"options":KEY_O,
			"menu":KEY_M
			}
	Save.save_controls()
	update_buttons()
