extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/Start.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_pressed():
	get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
	pass # Replace with function body.


func _on_Start_pressed():
	get_tree().change_scene("res://src/Levels/Tutorial.tscn")
	pass # Replace with function body.
