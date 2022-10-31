extends Control

func _ready():
	$VBoxContainer/Start.grab_focus()


func _on_Start_pressed():
	Main.coins = 0
	Main.deaths = 0
	get_tree().change_scene("res://src/Levels/Tutorial.tscn")
	Main.time = 0
	Main.tut = 0
	Main.l1 = 0
	Main.l2 - 0


func _on_Options_pressed():
	pass
#	get_tree().change_scene("res://src/Levels/Menus/Options.tscn")


func _on_Exit_pressed():
	get_tree().quit()
