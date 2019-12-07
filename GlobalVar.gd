extends Node

var level1 = true
var level2 = false
var level3 = false
var level4 = false
var level5 = false
var level6 = false

var currentLevel

var makanan = false
var minuman = false
var vaksin = false
var makan
var minum
var vaks
var cuaca

var targetLevel = 1
var hidup = 0
var mati = 0
var time = 60.0

func _ready():
	load_game()

func save_game():
	var file = File.new()
	file.open("user://savegame.save", file.WRITE)
	file.store_var(targetLevel)
	file.close()

func load_game():
	var file = File.new()
	if file.open("user://savegame.save", file.READ_WRITE) == OK:
		targetLevel = file.get_var()
	else:
		targetLevel = 1
	file.close()