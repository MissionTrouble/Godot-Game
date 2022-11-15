extends Sprite


func _ready():
	pass # Replace with function body.

var entered = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("Next") and entered):
		var dialog = Dialogic.start('Sign-Sign')
		add_child(dialog)
	pass


func _on_Area2D_body_entered(body):
	entered = true
	pass


func _on_Area2D_body_exited(body):
	entered = false
	pass # Replace with function body.
