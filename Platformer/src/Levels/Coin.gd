extends Area2D

onready var anim_player: AnimationPlayer = 	get_node("AnimationPlayer")

func _on_Coin_body_entered(body):
	Main.tempCoins += 1
	anim_player.play("CoinFadeOut")
