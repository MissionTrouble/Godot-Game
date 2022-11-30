extends Node2D

var firstloaded = false

func _ready():
	if(get_node("player").global_position == Vector2(270,980) ):
		Main.time = 0
		Save.game_data["time"] = Main.time
		var dialog = Dialogic.start('Sign')
		add_child(dialog)
		firstloaded = true
