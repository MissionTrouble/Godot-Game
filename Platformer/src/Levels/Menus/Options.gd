extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var offset = Vector2.ZERO

func _ready():
	Settings.TIMER = Save.game_data["timerEnabled"]
	Settings.COINS = Save.game_data["coinEnabled"]
	Settings.DEATHS = Save.game_data["deathEnabled"]
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton.pressed = Save.game_data["timerEnabled"]
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton2.pressed = Save.game_data["coinEnabled"] 
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton3.pressed = Save.game_data["deathEnabled"]  
	pass
# Called when the node enters the scene tree for the first time.

func _on_Exit_pressed():
	pass # Replace with function body.
	
func _process(delta):
	var cam = get_parent().get_parent().get_node("camera")
	if(cam != null):
		rect_global_position = cam.get_camera_position()-Vector2(offset)

func _on_CheckButton_toggled(button_pressed):
	Settings.TIMER = button_pressed
	Save.game_data["timerEnabled"] = button_pressed
	pass # Replace with function body.


func _on_CheckButton2_toggled(button_pressed):
	Settings.COINS = button_pressed
	Save.game_data["coinEnabled"] = button_pressed



func _on_CheckButton3_toggled(button_pressed):
	Settings.DEATHS = button_pressed
	Save.game_data["deathEnabled"] = button_pressed
	pass # Replace with function body.


func _on_EXIT_pressed():
	hide()
	Engine.time_scale = Main.timeScale
	Main.optionsVisible = false
	Save.save_data()
	pass # Replace with function body.


func _on_Save_pressed():
	Save.save_data()
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton.pressed = Save.game_data["timerEnabled"]
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton2.pressed = Save.game_data["coinEnabled"] 
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton3.pressed = Save.game_data["deathEnabled"]  


func _on_DeleteSave_pressed():
	print("delete")
	Save.game_data = {
		"level": "tutorial",
		"deaths": 0,
		"coins": 0,
		"time":0,
		"timerEnabled":false,
		"coinEnabled":true,
		"deathEnabled":true
	}
	Save.save_data()
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton.pressed = Save.game_data["timerEnabled"]
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton2.pressed = Save.game_data["coinEnabled"] 
	$TabContainer/Gameplay/MarginContainer/GridContainer/CheckButton3.pressed = Save.game_data["deathEnabled"]  
	get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
	pass # Replace with function body.
