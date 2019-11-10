extends Control

var inGameOverMenu 
var menuPauseActived
var timer = 5.0

func _ready():
	inGameOverMenu = false
	menuPauseActived = false
	$Pause.hide()
	$GameOver.hide()
	$ScrollContainer.get_h_scrollbar().hide()
	pass # Replace with function body.

func _process(delta):
	get_node("HUDPanel/HBoxContainer/Hidup").text = "Hidup : "
	get_node("HUDPanel/HBoxContainer/Mati").text = "Mati : "
	if timer > 0 and not menuPauseActived: 
		timer -= delta
	get_node("HUDPanel/HBoxContainer/Timer").text = "Waktu : " + String(int(timer))
	if timer < 1 and not inGameOverMenu:
		$HUDPanel/HBoxContainer/MenuPause.disabled
		$AnimationPlayer.play("GameOver")
		$GameOver.show()
		inGameOverMenu = true
	

func _on_MenuPause_pressed():
	$Pause.show()
	menuPauseActived = true
	pass # Replace with function body.


func _on_Ya_pressed():
	pass # Replace with function body.

func _on_Tidak_pressed():
	get_tree().change_scene("MainMenu.tscn")

func _on_Continue_pressed():
	$Pause.hide()
	menuPauseActived = false
	pass # Replace with function body.

func _on_ExitGame_pressed():
	get_tree().change_scene("MainMenu.tscn")
	pass # Replace with function body.
