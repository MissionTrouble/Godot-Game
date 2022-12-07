extends TextureRect



func _ready():
	Main.l2 = Save.game_data["time"]-Main.l1-Main.tut

	get_parent().get_node("HUD/HUD").coins(Save.game_data["coins"])
	get_parent().get_node("HUD/HUD").death(Save.game_data["deaths"])
	get_parent().get_node("HUD/HUD").time(str(stepify(Save.game_data["time"],0.1)))
	var time = Save.game_data["time"]
	rect_scale = Vector2(OS.get_screen_size().x/299,OS.get_screen_size().y/168)
	
func _physics_process(delta):
	if(Input.is_action_pressed("open_menu")):
		get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
