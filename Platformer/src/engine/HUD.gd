extends CanvasLayer


func death(deaths):
	$Deaths.visible = Save.settings["deathEnabled"]
	$Deaths.text = str("Deaths:" + str(deaths))

func coins(coins):
	$Coins.visible = Save.settings["coinEnabled"]
	$Coins.text = str("Coins:" + str(coins))

func time(time):
	$Timer.visible = Save.settings["timerEnabled"]
	$Timer.text = str("Time:" + str(time))
