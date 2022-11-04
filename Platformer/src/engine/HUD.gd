extends CanvasLayer

#signal start_game


func death(deaths):
	if(Settings.DEATHS):
		$Deaths.text = str("Deaths:" + str(deaths))
	else:
		$Deaths.text = str("")
func coins(coins):
	if(Settings.COINS):
		$Coins.text = str("Coins:" + str(coins))
	else:
		$Coins.text = str("")

func time(time):
	if(Settings.TIMER):
		$Timer.text = str("Time:" + str(time))
	else:
		$Timer.text = str("")
