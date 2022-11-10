extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()


func _on_Start_pressed():
	get_tree().change_scene("res://src/Levels/"+Save.game_data["level"]+".tscn")
	print("x")
	Main.time = Save.game_data["time"]
	Main.deaths = Save.game_data["deaths"]
	Main.coins = Save.game_data["coins"]
	print(Save.game_data)
#	Main.tut = 0
#	Main.l1 = 0
#	Main.l2 - 0


func _on_Options_pressed():
	if(!Main.optionsVisible):
		get_node("Options").show()
		Engine.time_scale = 0
		Main.optionsVisible = true
	else:
		get_node("Options").hide()
		Engine.time_scale = Main.timeScale
		Main.optionsVisible = false
	pass
#	get_tree().change_scene("res://src/Levels/Menus/Options.tscn")


func _on_Exit_pressed():
	get_tree().quit()
