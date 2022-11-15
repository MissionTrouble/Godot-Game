extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var offset = Vector2.ZERO

func _ready():
#	Settings.TIMER = Save.game_data["timerEnabled"]
#	Settings.COINS = Save.game_data["coinEnabled"]
#	Settings.DEATHS = Save.game_data["deathEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/TIMER BUTTON".pressed = Save.settings["timerEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/COIN BUTTON".pressed = Save.settings["coinEnabled"] 
	$"TabContainer/Gameplay/MarginContainer/GridContainer/DEATH BUTTON".pressed = Save.settings["deathEnabled"]  
	pass
# Called when the node enters the scene tree for the first time.

func _on_Exit_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	Save.save_data()
	Save.save_settings()
	
func _process(delta):
	var cam = get_parent().get_parent().get_node("camera")
	if(cam != null):
		rect_global_position = cam.get_camera_position()-Vector2(offset)

func _on_EXIT_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	Save.save_data()
	Save.save_settings()


func _on_Save_pressed():
	Save.save_data()
	Save.save_settings()
	$"TabContainer/Gameplay/MarginContainer/GridContainer/TIMER BUTTON".pressed = Save.settings["timerEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/COIN BUTTON".pressed = Save.settings["coinEnabled"] 
	$"TabContainer/Gameplay/MarginContainer/GridContainer/DEATH BUTTON".pressed = Save.settings["deathEnabled"]  


func _on_DeleteSave_pressed():
	var dir = Directory.new()
	dir.remove("user://save_file.save")
	Save.load_data()
	$"TabContainer/Gameplay/MarginContainer/GridContainer/TIMER BUTTON".pressed = Save.settings["timerEnabled"]
	$"TabContainer/Gameplay/MarginContainer/GridContainer/COIN BUTTON".pressed = Save.settings["coinEnabled"] 
	$"TabContainer/Gameplay/MarginContainer/GridContainer/DEATH BUTTON".pressed = Save.settings["deathEnabled"]  
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
	_ready()
	pass # Replace with function body.
