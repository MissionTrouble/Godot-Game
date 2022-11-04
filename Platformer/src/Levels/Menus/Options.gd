extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _on_Exit_pressed():
	pass # Replace with function body.
	


func _on_CheckButton_toggled(button_pressed):
	Settings.TIMER = button_pressed
	pass # Replace with function body.


func _on_CheckButton2_toggled(button_pressed):
	Settings.COINS = button_pressed



func _on_CheckButton3_toggled(button_pressed):
	Settings.DEATHS = button_pressed
	pass # Replace with function body.
