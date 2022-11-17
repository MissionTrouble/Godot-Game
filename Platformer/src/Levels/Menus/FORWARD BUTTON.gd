extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal forward_change
var changing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed and changing == true:
		if(event.scancode == KEY_ESCAPE):
			get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").hide()
			changing = false
		print(event.scancode)
		
	
	
	if event is InputEventMouseButton \
	and get_rect().has_point(to_local(event.position)) \
	and event.pressed \
	and event.button_index == BUTTON_LEFT \
	and get_rect().has_point(to_local(event.position)):
		get_parent().get_parent().get_parent().get_parent().get_parent().get_parent().get_node("KeyPopup").show()
		changing = true
		emit_signal("forward_change")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
