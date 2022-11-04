extends Node


var deaths = 0
var coins = 0 
var tempCoins = 0
var time = 0
var tut = 0
var l1 = 0
var l2 = 0
var lastScene

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.time_scale = 1
	time +=delta
	pass
