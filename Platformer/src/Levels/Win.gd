extends TextureRect



func _ready():
	Main.l2 = Main.time-Main.l1-Main.tut

	get_parent().get_node("HUD/HUD").death(Main.deaths)
	get_parent().get_node("HUD/HUD").death(Main.deaths)
	get_parent().get_node("HUD/HUD").time(str(stepify(Main.time,0.1))+"\n tut:"+str(stepify(Main.tut,0.1))+"\n 1:"+str(stepify((Main.l1),0.1))+"\n 2:"+str(stepify((Main.l2),0.1)))
	var time = Main.time
	rect_scale = Vector2(OS.get_screen_size().x/299,OS.get_screen_size().y/168)
	
func _physics_process(delta):
	if(Input.is_action_pressed("open_menu")):
		get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
