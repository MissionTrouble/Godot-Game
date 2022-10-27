extends CanvasLayer

#signal start_game


func death(deaths):
	$Deaths.text = str("Deaths:" + str(deaths))
func coins(coins):
	$Coins.text = str("Coins:" + str(coins))
func time(time):
	$Timer.text = str("Time:" + str(time))
