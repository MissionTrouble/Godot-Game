extends KinematicBody2D 

export var speed: = Vector2(800,1500)
export var gravity: = 400
export var jumpForce: = 200
export var wallSpeed: = 200
export var stomp_impulse = 50
var velocity: = Vector2.ZERO
var e: = 0.0
var double_jump_used: = false
var released_jump = false
var scene
var coins
var level_parameters := {
	"deaths":0
}
func load_level(new_level_parameters: Dictionary):
	level_parameters = new_level_parameters

func _ready():
		get_parent().get_node("HUD/HUD").death(level_parameters.deaths)
func _physics_process(delta: float) -> void:
	scene = get_tree().get_current_scene().get_name()
	var direction: = get_direction()
	
	if(direction.y == -1):
		on_floor()
		if(on_wall()):
			velocity.y = -wallSpeed
		else:
			 velocity.y = -jumpForce
	
	if(direction.y == 1 and velocity.y < speed.y):
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
		level_parameters.deaths += 1
#		transfer_data(scene,get_parent().get_node("Portal").get(next_scene))
		get_tree().change_scene("res://src/Levels/"+scene+".tscn")


func get_direction() -> Vector2:
	if(Input.is_action_pressed("open_menu")):
		get_tree().change_scene("res://src/Levels/Menus/Menu.tscn")
	if(Input.is_action_pressed("options")):
		get_tree().change_scene("res://src/Levels/Menus/Options.tscn")
	var x: = (Input.get_action_strength("move_right")
		-Input.get_action_strength("move_left"))
	var y: = 1
	if(Input.is_action_just_released("jump")):
		released_jump = true
	if ((on_floor()or !double_jump_used) and Input.is_action_just_pressed("jump")):
		if(released_jump and !double_jump_used):
			double_jump_used = true
		released_jump = false
		y =  -1
	if(on_wall() and Input.is_action_pressed("jump")):
		y = -1

	return(Vector2(x,y))

func on_floor() -> bool:
	var ground: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle() == 0):
			ground = true
			double_jump_used = false
	return ground

func on_wall() -> bool:
	var wall: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle()*180/PI > 89.9 and collision.get_angle()*180/PI < 90.1):
			wall = true
			double_jump_used = false
	return wall

func on_roof() -> bool:
	var roof: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle()*180/PI > 189.9 and collision.get_angle()*180/PI < 190.1):
			roof = true
	return roof

func transfer_data(old_scene,new_scene):
	
	pass



func _on_EnemyDetector_body_entered(_body):
	level_parameters.deaths += 1
	get_tree().change_scene("res://src/Levels/"+scene+".tscn")
	
func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float)->Vector2:
		var out = linear_velocity
		double_jump_used = false
		out.y = -impulse
		return out


func _on_StompDetector_area_entered(area):
	if(area.name == "StompDetector"):
		velocity = calculate_stomp_velocity(velocity, stomp_impulse)


#func _on_Coins_child_exiting_tree(node):
#	coins = coins + 1;
#	print(coins)
