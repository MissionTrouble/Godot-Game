extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	if(Save.experimental):
		print(Save.level)
		get_tree().change_scene_to(Save.level)
	else:
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
	if(Save.settings["autosave"]):
		Save.save()
	get_tree().quit()
