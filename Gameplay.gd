extends Node

signal Win
signal GameOver
signal ChickenDie

signal FoodClicked
signal WaterClicked
signal VaccineClicked

var currentLevel
var isPaused
var time
var life
var death
var weather
var isFoodOn
var isWaterOn
var isVaccineOn

func _ready():
	isPaused = false
	time = 181.0
	life = get_tree().get_nodes_in_group("chickens").size()
	death = 0
	weather = "panas"
	isFoodOn = false
	isWaterOn = false
	isVaccineOn = false

func _process(delta):
	get_node("HUDPanel/HBoxContainer/Timer").text = "Timer : " + String(int(time)) + " detik"
	get_node("HUDPanel/HBoxContainer/Hidup").text = "Hidup : " + String(life)
	get_node("HUDPanel/HBoxContainer/Mati").text = "Mati : " + String(death)
	if not isPaused:
		time -= delta
	if time <= 1:
		emit_signal("Win")
	if life == 0:
		emit_signal("GameOver")

func _on_MakananTimer_timeout():
	GlobalVar.makan = 1
	get_node("/root/Level 1/Tools/makanan/makan").play("idle")

func _on_MinumanTimer_timeout():
	GlobalVar.minum = 1
	get_node("/root/Level 1/Tools/Air/air").play("idle")

func _on_VaksinTimer_timeout():
	GlobalVar.vaks = 1
	get_node("/root/Level 1/Tools/vaksin/Vaksin").play("idle")

func win():
	isPaused = true

func gameover():
	isPaused = true

func chickenDie():
	life -= 1
	death += 1
