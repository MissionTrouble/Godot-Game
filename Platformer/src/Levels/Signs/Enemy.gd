extends Sprite



var entered = false

func _process(delta):
	if(Input.is_action_just_released("Next") and entered):
		var dialog = Dialogic.start('Sign-Enemy')
		add_child(dialog)



func _on_Area2D_body_entered(body):
	entered = true



func _on_Area2D_body_exited(body):
	entered = false
