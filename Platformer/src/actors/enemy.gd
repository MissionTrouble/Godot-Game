extends "res://src/actors/Actors.gd"

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
		velocity.y += delta*gravity
	move_and_slide(velocity)

func _on_StompDetector_body_entered(body:KinematicBody2D) -> void:
		queue_free()

func _on_floorRight_body_exited(body):
	if(body != KinematicBody2D):
		reversed = !reversed

func _on_floorLeft_body_exited(body):
	if(body != KinematicBody2D):
		reversed = !reversed
