extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	print(Save.game_data)
#	get_tree().change_scene_to(Save.game_data["level"])
	get_tree().change_scene("res://src/Levels/"+Save.game_data['level']+".tscn")
	
	Main.time = Save.game_data["time"]
	Main.deaths = Save.game_data["deaths"]
	Main.coins = Save.game_data["coins"]

func _on_Options_pressed():
	if(!Main.optionsVisible):
		get_node("Options").show()
		Engine.time_scale = 0
		Main.optionsVisible = true
	else:
		get_node("Options").hide()
		Engine.time_scale = Main.timeScale
		Main.optionsVisible = false


func _on_Exit_pressed():
	Save.save_data()
	Save.save_settings()
	get_tree().quit()
