extends Popup


func _ready():
	update_buttons()

func update_buttons():
	$"TabContainer/Gameplay/MarginContainer/GridContainer/TIMER BUTTON".pressed = Save.settings["timerEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/COIN BUTTON".pressed = Save.settings["coinEnabled"] 
	$"TabContainer/Gameplay/MarginContainer/GridContainer/DEATH BUTTON".pressed = Save.settings["deathEnabled"] 


func _on_Exit_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	Save.save_data()
	Save.save_settings()


func _process(delta):
	var cam = get_parent().get_parent().get_node("camera")
	if(cam != null):
		rect_global_position = cam.get_camera_position()


func _on_EXIT_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false

	Save.save_data()
	Save.save_settings()


func _on_Save_pressed():
	Save.save_data()
	Save.save_settings()
	update_buttons()


func _on_DeleteSave_pressed():
	var dir = Directory.new()
	dir.remove("user://save_file.save")

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
