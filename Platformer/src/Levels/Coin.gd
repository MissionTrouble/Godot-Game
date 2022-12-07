extends Area2D

onready var anim_player: AnimationPlayer = 	get_node("AnimationPlayer")
var time = -1
func _on_Coin_body_entered(body):
	Save.game_data["tempcoins"] += 1
	time = Save.game_data["time"]
	anim_player.play("CoinFadeOut")


func _physics_process(delta):
	if time != -1:
		if Save.game_data["time"]-time > 0.58:
			get_parent().queue_free()
	
