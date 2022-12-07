extends Node


var printtimer = 0
var tut = 0
var l1 = 0
var l2 = 0
var lastScene
var optionsVisible = false
var menuVisible = false
var timeScale = 1
signal PRINT

func _process(delta):
	printtimer += delta
	if printtimer > 1:
		printtimer = 0
		emit_signal("PRINT")
	Save.game_data["time"] +=delta
