extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene

func _get_configuration_warning() -> String:
	if not next_scene:
		return "The next scene property can't be empty" 
	else:
		return ""
func teleport() -> void:
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)



func _on_body_entered(body):
	Main.coins += Main.tempCoins
	Main.tempCoins = 0
	teleport()
