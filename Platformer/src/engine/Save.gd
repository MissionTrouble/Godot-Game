extends Node

const SAVE_FILE = "user://save_file.save"
var game_data = {}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
	pass # Replace with function body.


func save_data():
	print(game_data)
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		game_data = {
			"level": "tutorial",
			"deaths": 0,
			"coins": 0,
			"time":0,
			"timerEnabled":false,
			"coinEnabled":true,
			"deathEnabled":true
		}
		save_data()
	file.open(SAVE_FILE, file.READ)
	game_data = file.get_var()
	file.close()
