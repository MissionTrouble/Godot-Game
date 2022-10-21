extends Area2D

var coins = 0
onready var anim_player: AnimationPlayer = 	get_node("AnimationPlayer")
export var levelCoins = 1;

func _ready():
	get_parent().get_parent().get_parent().get_node("HUD/HUD").update_score(levelCoins)
	
func _on_Coin_body_entered(body):
	coins += 1
	print(coins)
	anim_player.play("CoinFadeOut")
	get_parent().get_parent().get_parent().get_node("HUD/HUD").increase_score(levelCoins)
