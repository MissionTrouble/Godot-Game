extends "res://src/actors/Actors.gd"

export var speed: = Vector2(800,1500)
export var gravity: = 400
export var jumpForce: = 200
export var wallSpeed: = 200
export var stomp_impulse = 50
var velocity: = Vector2.ZERO
var e: = 0.0

var released_jump = false
var scene
var direction: = Vector2.ZERO

func _ready():
	Main.tempCoins = 0
	scene = get_tree().get_current_scene().get_name()

func _physics_process(delta: float) -> void:
	get_parent().get_node("LevelReq/HUD/HUD").death(Main.deaths)
	get_parent().get_node("LevelReq/HUD/HUD").coins(Main.coins+Main.tempCoins)
	get_parent().get_node("LevelReq/HUD/HUD").time(stepify(Main.time,0.1))
	

	
	if(direction.y == -1):
		on_floor()
		if(on_wall()):
			velocity.y = -wallSpeed
		else:
			 velocity.y = -jumpForce
	
	if(velocity.y < speed.y):
		velocity.y += gravity*delta
	
	if(on_wall() and velocity.y > 0):
		velocity.y = 0
	
	velocity.x = direction.x * speed.x
	
	if(direction.x != 0):
		e = float(direction.x)
	
	if(on_wall()):
		if(e == 1):
			velocity.x += 5
		if(e == -1):	
			velocity.x -= 5
	
	if(move_and_slide(velocity) != Vector2.ZERO):
		velocity = move_and_slide(velocity)
		
	if(global_position.y > 2000):
		Main.deaths += 1
		get_tree().change_scene("res://src/Levels/"+scene+".tscn")

#Old input system
#func get_direction():
#	if(Input.is_action_pressed("open_menu")):
#		print("sa")
#		if(Save.settings["autosave"]):
#			var packed_scene = PackedScene.new()
#			packed_scene.pack(get_tree().get_current_scene())
#			if(Save.experimental):
#				Save.game_data["level"] = packed_scene
#			else:
#				Save.game_data["level"] = scene
#			Save.game_data["deaths"] = Main.deaths
#			Save.game_data["coins"] = Main.coins
#			Save.game_data["time"] = Main.time
#			Save.save()
#		get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
#	if(Input.is_action_just_pressed("options")):
#		if(!Main.optionsVisible):
#			get_parent().get_node("LevelReq/Options").show()
#			Engine.time_scale = 0
#			Main.optionsVisible = true
#		else:
#			get_parent().get_node("LevelReq/Options").hide()
#			Engine.time_scale = Main.timeScale
#			Main.optionsVisible = false
#
#
#	var x: = (Input.get_action_strength("move_right")
#		-Input.get_action_strength("move_left"))
#	var y: = 1
#	if(Input.is_action_just_released("jump")):
#		released_jump = true
#	if ((on_floor()or !double_jump_used) and Input.is_action_just_pressed("jump")):
#		if(released_jump and !double_jump_used):
#			double_jump_used = true
#		released_jump = false
#		y =  -1
#	if(on_wall() and Input.is_action_pressed("jump")):
#		y = -1
#	direction = Vector2(x,y)

func _on_EnemyDetector_body_entered(_body):
	Main.deaths += 1
	get_tree().change_scene("res://src/Levels/"+scene+".tscn")

func _on_StompDetector_area_entered(area):
	if(area.name == "StompDetector"):
		double_jump_used = false
		velocity.y = -stomp_impulse

func _input(event):
	if event is InputEventKey:
		if  event.scancode == Save.controls["jump"]:
			if(!event.pressed):
				released_jump = true
				direction.y = 0
			if(event.is_echo()):
				direction.y = 0
			if ((on_floor()or !double_jump_used) and event.pressed):
				if(released_jump and !double_jump_used):
					double_jump_used = true
					released_jump = false
					direction.y =  -1
			if(on_wall() and (event.pressed or event.is_echo())):
				direction.y = -1
		else:
			direction.y = 0


		if event.scancode == Save.controls["move_left"] or event.scancode == Save.controls["move_right"]:
			if event.scancode == Save.controls["move_left"] and event.pressed:
				direction.x = -1 
			elif event.scancode == Save.controls["move_right"] and event.pressed:
				direction.x = 1 
			elif !event.pressed or direction.x > 1 or direction.x <-1:
				direction.x = 0


		if event.scancode == Save.controls["options"] and !event.is_echo() and event.pressed:
			if(!Main.optionsVisible):
				get_parent().get_node("LevelReq/Options").show()
				Engine.time_scale = 0
				Main.optionsVisible = true
			else:
				get_parent().get_node("LevelReq/Options").hide()
				Engine.time_scale = Main.timeScale
				Main.optionsVisible = false


		if event.scancode == Save.controls["menu"] and !event.is_echo() and event.pressed:
			if(Save.settings["autosave"]):
				var packed_scene = PackedScene.new()
				packed_scene.pack(get_tree().get_current_scene())
				if(Save.experimental):
					Save.game_data["level"] = packed_scene
				else:
					Save.game_data["level"] = scene
				Save.game_data["deaths"] = Main.deaths
				Save.game_data["coins"] = Main.coins
				Save.game_data["time"] = Main.time
				Save.save()
			get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
