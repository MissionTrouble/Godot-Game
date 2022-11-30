extends Node2D



func _ready():
	Main.time = 0
	Save.game_data["time"] = Main.time
	var dialog = Dialogic.start('Sign')
	add_child(dialog)
