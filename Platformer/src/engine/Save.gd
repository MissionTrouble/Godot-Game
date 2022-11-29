extends Node

const SAVE_FILE = "user://save_file.save"
const SETTINGS_FILE = "user://settings_file.save"
const CONTROLS_FILE = "user://controls_file.save"
var game_data = {}
var settings = {}
var level: PackedScene
var experimental = true
var gamekeys = ["deaths","coins","time"]
var settingskeys = ["timerEnabled","coinEnabled","deathEnabled","autosave"]
var controlkeys = ["jump","move_left","move_right","options","menu"]
var controls = {}
onready var first_scene: PackedScene = preload("res://src/Levels/Tutorial.tscn")

func _ready():
#	var dir = Directory.new()
#	dir.remove("user://save_file.save")
	load_settings()
	load_data()
	load_controls()
	load_level()
	print(controls)

func save():
	save_controls()
	save_data()
	save_settings()
	save_level()

func save_level():
	ResourceSaver.save("res://level.tscn", level)

func level_reset():
	level = preload("res://src/Levels/Tutorial.tscn")

func load_level():
#	level = preload("res://src/Levels/Tutorial.tscn")
	level = preload("res://level.tscn")
	ResourceSaver.save("res://level.tscn", level)

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
	if !controls.has_all(controlkeys):
		controls = {
			"jump":KEY_W,
			"move_left":KEY_A,
			"move_right":KEY_D,
			"options":KEY_O,
			"menu":KEY_M
			}
		save_controls()

func save_data():
	var file = File.new()
	file.open(SAVE_FILE, File.WRITE)
	file.store_var(game_data)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exists(SAVE_FILE):
		game_data = {
			"deaths": 0,
			"coins": 0,
			"time":0,
		}
		save_data()
	file.open(SAVE_FILE, file.READ)
	game_data = file.get_var()
	file.close()
	if !game_data.has_all(gamekeys):
		game_data = {
			"deaths": 0,
			"coins": 0,
			"time":0,
		}
		save_data()

func load_settings():
	var file = File.new()
	if not file.file_exists(SETTINGS_FILE):
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
	if !settings.has_all(settingskeys):
		settings = {
			"timerEnabled":false,
			"coinEnabled":true,
			"deathEnabled":true,
			"autosave": false
		}
		save_settings()
	
func save_settings():
	print(settings)
	var file = File.new()
	file.open(SETTINGS_FILE, File.WRITE)
	file.store_var(settings)
	file.close()
