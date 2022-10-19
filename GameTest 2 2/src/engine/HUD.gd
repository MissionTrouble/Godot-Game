extends CanvasLayer

signal start_game
var score = 0;

func increase_score(Max):
	score += 1;
	$Coins.text = str("Coins:" + str(score))

func update_score(Max):
	score = 0;
	$Coins.text = str("Coins:" + str(score))

func death(deaths):
	print("deaths:" +str(deaths))
	$Deaths.text = str("Deaths:" + str(deaths))
