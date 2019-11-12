extends Control

var cuaca
var timer = 300.0
var isPlay

func _ready():
	isPlay = true
	$ScrollContainer.get_h_scrollbar().hide()
	$GameOver.hide()
	$PauseMenu.hide()
	cuaca = "panas"
	pass # Replace with function body.

func _process(delta):
	if isPlay:
		timer -= delta
	
	var hidup = 2 - GlobalVar.mati
	get_node("HUDPanel/HBoxContainer/Timer").text = "Timer : " + String(int(timer)) + " detik"
	get_node("HUDPanel/HBoxContainer/Hidup").text = "Hidup : " + String(hidup)
	get_node("HUDPanel/HBoxContainer/Mati").text = "Mati : " + String(GlobalVar.mati)
	
	if timer <= 1:
		get_tree().change_scene("MainMenu.tscn")
	
	if GlobalVar.mati == 1:
		isPlay = false
		print("Game Over")
		$GameOver.show()

func randomly(inputan):
	return inputan[randi() % inputan.size()]

func _on_CuacaTimer_timeout():
	randomize()
	var x = randomly([0,1])
	if x == 0:
		GlobalVar.cuaca = "Panas"
	else:
		GlobalVar.cuaca = "Hujan"
	get_node("/root/Level 1/Background").play(GlobalVar.cuaca)
	var t = rand_range(0,100)
	get_node("/root/Level 1/CuacaTimer").start(t)
	pass # Replace with function body.


func _on_SakitTimer_ready():
	
	pass # Replace with function body.



func _on_MakananTimer_timeout():
	GlobalVar.makan = 1
	get_node("/root/Level 1/Tools/makanan/makan").play("idle")
	pass # Replace with function body.


func _on_MinumanTimer_timeout():
	GlobalVar.minum = 1
	get_node("/root/Level 1/Tools/Air/air").play("idle")
	pass # Replace with function body.


func _on_VaksinTimer_timeout():
	GlobalVar.vaks = 1
	get_node("/root/Level 1/Tools/vaksin/Vaksin").play("idle")
	pass # Replace with function body.


func _on_PauseButton_pressed():
	$PauseMenu.show()
	isPlay = false

func _on_Continue_pressed():
	$PauseMenu.hide()
	isPlay = true

func _on_Exit_pressed():
	get_tree().change_scene("MainMenu.tscn")
