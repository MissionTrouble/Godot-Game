extends Node2D

var firstloaded = false

func _ready():
	if(get_node("player").global_position == Vector2(270,980)):
		Save.game_data["time"] = 0
		var dialog = Dialogic.start('Sign')
		add_child(dialog)
		firstloaded = true
