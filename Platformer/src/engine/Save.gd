extends Node

const SAVE_FILE = "user://save_file.save"
const SETTINGS_FILE = "user://settings_file.save"
const CONTROLS_FILE = "user://controls_file.save"
var game_data = {}
var settings = {}
var experimental = false
var gamekeys = ["level","deaths","coins","time"]
var settingskeys = ["timerEnabled","coinEnabled","deathEnabled","autosave"]
var controlkeys = ["jump","move_left","move_right","options","menu"]
var controls = {}

func _ready():
	
	load_settings()
	load_data()
	load_controls()
	print(controls)


func save():
	save_controls()
	save_data()
	save_settings()

func save_controls():
	var file = File.new()
	file.open(CONTROLS_FILE, File.WRITE)
	file.store_var(controls)
	file.close()

func load_controls():
	var file = File.new()
	if not file.file_exists(CONTROLS_FILE):
		controls = {"jump":KEY_W,
				"move_left":KEY_A,
				"move_right":KEY_D,
				"options":KEY_O,
				"menu":KEY_M
				}
		save_controls()
	file.open(CONTROLS_FILE, file.READ)
	controls = file.get_var()
	file.close()

func save_data():
	print(game_data)
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE) or !game_data.has_all(gamekeys):
		var level
		if(experimental):
			level = preload("res://src/Levels/Tutorial.tscn")
		else:
			level = "tutorial"
		game_data = {
			"level": level,
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
	if not file.file_exists(SETTINGS_FILE) or !settings.has_all(settingskeys):
		settings = {
			"timerEnabled":false,
			"coinEnabled":true,
			"deathEnabled":true,
			"autosave": false
		}
		save_settings()
	file.open(SETTINGS_FILE, file.READ)
	settings = file.get_var()
	file.close()
	
func save_settings():
	print(settings)
	var file = File.new()
	file.open(SETTINGS_FILE, File.WRITE)
	file.store_var(settings)
	file.close()
