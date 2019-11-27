extends Node

var user_data = {}
var player_name = ""
var current_level = 1

func _ready():
	
	pass

func save_file_exists():
	var load_game = File.new()
	if (load_game.file_exists("user://savegame.save")):
		return true
	else:
		return false

func save():
	user_data["player_name"] = player_name
	user_data["current_level"] = current_level

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_string(to_json(user_data))
	save_game.close()