extends Node2D


func _ready():
	if(Main.l1 == 0):
		Main.l1 = Main.time-Main.tut
