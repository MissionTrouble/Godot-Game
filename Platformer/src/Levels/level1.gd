extends Node2D


func _ready():
	if(Main.tut == 0):
		Main.tut = Save.game_data["time"]
