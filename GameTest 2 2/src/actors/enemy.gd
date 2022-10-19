extends KinematicBody2D

export var speed: = Vector2(8000,15000)
export var gravity: = 600
export var jumpForce: = 800
export var wallSpeed: = 300
var reversed: = false
var velocity: = Vector2.ZERO

func _physics_process(delta):
	if(on_wall()):
		reversed = !reversed
	if(reversed):
		velocity.x = -speed.x
	else:
		velocity.x = speed.x
	if(velocity.y < speed.y):
		velocity.y += gravity*delta
		pass
	move_and_slide(velocity)
	

func on_floor() -> bool:
	var ground: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle() == 0):
			ground = true
	return ground

func on_wall() -> bool:
	var wall: = false
	for index in get_slide_count():
		var collision: = get_slide_collision(index)
		if(collision.get_angle()*180/PI > 89.9 and collision.get_angle()*180/PI < 90.1):
			wall = true
	return wall
	
func _on_StompDetector_body_entered(body:PhysicsBody2D) -> void:
	if(get_parent().get_parent().get_node("player").velocity.y > 0):
		print(body.global_position.y)
		print(get_node("StompDetector").global_position.y)
		return
	queue_free()

func _on_floorRight_body_exited(_body):
	reversed = !reversed

func _on_floorLeft_body_exited(_body):
	reversed = !reversed
