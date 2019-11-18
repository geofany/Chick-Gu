extends Node

var isLevelPanelHidden = true

func _ready():
	$PlayerPanel.hide()
	$AnimationChicken.play("AyamGakJelas")
	$HBoxContainer/Background/Ayam01.play("idle")
	$HBoxContainer/Background/Ayam02.play("idle")
	$HBoxContainer/Background/Ayam03.play("idle")
	isLevelPanelHidden = true

# OptionPanel
func _on_NewGame_pressed():
	$PlayerPanel.show()

func _on_LoadGame_pressed():
	pass

func _on_Credits_pressed():
	$CreditsPanel.popup()

func _on_Exit_pressed():
	get_tree().quit()

# PlayerForm
func _on_OK_pressed():
	if isLevelPanelHidden:
		$PlayerPanel.hide()
		$AnimationPanel.play("LevelMenuShow")
		$HBoxContainer/OptionPanel/VBoxContainer/NewGame.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/LoadGame.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Credits.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Quit.set_disabled(true)
		isLevelPanelHidden = false

func _on_Cancel_pressed():
	$PlayerPanel.hide()
	$PlayerPanel/VBoxContainer/PlayerInput.clear()

# LevelPanel
func _on_LevelClose_pressed():
	if not isLevelPanelHidden:
		$AnimationPanel.play("LevelMenuHide")
		$HBoxContainer/OptionPanel/VBoxContainer/NewGame.set_disabled(false)
		$HBoxContainer/OptionPanel/VBoxContainer/LoadGame.set_disabled(false)
		$HBoxContainer/OptionPanel/VBoxContainer/Credits.set_disabled(false)
		$HBoxContainer/OptionPanel/VBoxContainer/Quit.set_disabled(false)
		isLevelPanelHidden = true

func _on_Level_pressed():
	GlobalVar.targetLevel = 1
	get_tree().change_scene("Level 1.tscn")

