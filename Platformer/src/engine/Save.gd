extends Node

const SAVE_FILE = "user://save_file.save"
const SETTINGS_FILE = "user://settings_file.save"
var game_data = {}
var settings = {}
var settingskeys = ["timerEnabled","coinEnabled","deathEnabled"]
# Called when the node enters the scene tree for the first time.
func _ready():
	load_settings()
	load_data()
	pass # Replace with function body.


func save_data():
	print(game_data)
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()

func load_data():
	if not game_data:
		var dir = Directory.new()
		dir.remove("user://save_file.save")
	var file = File.new()
	if not file.file_exists(SAVE_FILE) or game_data.size() == 0:
		#var packed_scene = PackedScene.new()
		#packed_scene = preload("res://src/Levels/Tutorial.tscn")
		game_data = {
			#"level": packed_scene,
			"level": "tutorial",
			"deaths": 0,
			"coins": 0,
			"time":0,
		}
		save_data()
	file.open(SAVE_FILE, file.READ)
	game_data = file.get_var()
	file.close()

func load_settings():
	var file = File.new()
	if not file.file_exists(SETTINGS_FILE):
		settings = {
			"timerEnabled":false,
			"coinEnabled":true,
			"deathEnabled":true
		}
		save_settings()

	file.open(SETTINGS_FILE, file.READ)
	settings = file.get_var()
	if settings.size() != 3:
		settings = {
			"timerEnabled":false,
			"coinEnabled":true,
			"deathEnabled":true
		}
		save_settings()
	file.close()
	
func save_settings():
	print(settings)
	var file = File.new()
	file.open(SETTINGS_FILE, File.WRITE)
	file.store_var(settings)
	file.close()
