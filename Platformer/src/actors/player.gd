extends "res://src/actors/Actors.gd"

export var speed: = Vector2(800,1500)
export var gravity: = 400
export var jumpForce: = 200
export var wallSpeed: = 200
export var stomp_impulse = 50
var velocity: = Vector2.ZERO
var e: = 0.0

var released_jump = true
var scene
var direction: = Vector2.ZERO


func _ready():
	get_node("/root/INPUT").connect("menu", self, "menu")
	get_node("/root/INPUT").connect("options", self, "options")
	get_node("/root/INPUT").connect("move_right", self, "move_right")
	get_node("/root/INPUT").connect("move_left", self, "move_left")
	get_node("/root/INPUT").connect("jump", self, "jump")
	scene = get_tree().get_current_scene().get_name()
	direction.x = 0
	if(INPUT.left):
		direction.x += -1
	if(INPUT.right):
		direction.x += 1

func _physics_process(delta: float) -> void:
	
	get_parent().get_node("LevelReq/HUD/HUD").death(Save.game_data["deaths"])
	get_parent().get_node("LevelReq/HUD/HUD").coins(Save.game_data["coins"]+Save.game_data["tempcoins"])
	get_parent().get_node("LevelReq/HUD/HUD").time(stepify(Save.game_data["time"],0.1))
	on_floor()
	if(INPUT.jump and on_wall()):
		velocity.y = -wallSpeed
	if(direction.y == -1):
		
		if(on_wall()):
			velocity.y = -wallSpeed
		else:
			velocity.y = -jumpForce
			direction.y = 0
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
		Save.game_data["deaths"] += 1
		get_tree().change_scene("res://src/Levels/"+scene+".tscn")

func _on_EnemyDetector_body_entered(_body):
	Save.game_data["deaths"] += 1
	Save.game_data["tempoins"] = 0
	get_tree().change_scene("res://src/Levels/"+scene+".tscn")

func _on_StompDetector_area_entered(area):
	if(area.name == "StompDetector"):
		double_jump_used = false
		velocity.y = -stomp_impulse

func jump(event):
	if(on_wall()):
		direction.y = -1
	if(!event.pressed):
		released_jump = true
		direction.y = 0
	if ((on_floor()or !double_jump_used) and event.pressed):
		if(released_jump and !double_jump_used):
			double_jump_used = true
			released_jump = false
			direction.y =  -1


func move_left(event):
	if(!event.is_echo()):
		if event.pressed:
			direction.x += -1 
		if !event.pressed:
			direction.x += 1
		if direction.x >1:
			direction.x = 1
		if direction.x <-1:
			direction.x = -1

func move_right(event):
	if(!event.is_echo()):
		if event.pressed:
			direction.x += 1 
		if !event.pressed:
			direction.x += -1
		if direction.x >1:
			direction.x = 1
		if direction.x <-1:
			direction.x = -1


func options(event):
	if(!Main.optionsVisible):
		get_parent().get_node("LevelReq/Options").show()
		Engine.time_scale = 0
		Main.optionsVisible = true
	else:
		get_parent().get_node("LevelReq/Options").hide()
		Engine.time_scale = Main.timeScale
		Main.optionsVisible = false

func menu(event):
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	if(Save.experimental):
		Save.game_data["level"] = packed_scene
	else:
		Save.game_data["level"] = scene
#	Save.game_data["deaths"] = Main.deaths
#	Save.game_data["coins"] = Main.coins
#	Save.game_data["tempcoins"] = Main.tempCoins
#	Save.game_data["time"] = Main.time
	Save.level = packed_scene
	if(Save.settings["autosave"]):
		Save.save()
	if(!get_parent().get_node("LevelReq/Options").visible):
		get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
