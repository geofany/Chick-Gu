extends Node

var isLevelPanelHidden = true

func _ready():
	$PlayerPanel.hide()
	$AnimationChicken.play("AyamGakJelas")
	$HBoxContainer/Background/Ayam01.play("idle")
	$HBoxContainer/Background/Ayam02.play("idle")
	$HBoxContainer/Background/Ayam03.play("idle")
	$LevelPanel/ScrollContainer/VBoxContainer/Level_01.set_disabled(true)
	$LevelPanel/ScrollContainer/VBoxContainer/Level_02.set_disabled(true)
	$LevelPanel/ScrollContainer/VBoxContainer/Level_03.set_disabled(true)
	$LevelPanel/ScrollContainer/VBoxContainer/Level_04.set_disabled(true)
	$LevelPanel/ScrollContainer/VBoxContainer/Level_05.set_disabled(true)
	$LevelPanel/ScrollContainer/VBoxContainer/Level_06.set_disabled(true)
	isLevelPanelHidden = true

func _process(delta):
	if GlobalVar.level1 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_01.set_disabled(false)
	if GlobalVar.level2 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_02.set_disabled(false)
	if GlobalVar.level3 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_03.set_disabled(false)
	if GlobalVar.level4 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_04.set_disabled(false)
	if GlobalVar.level5 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_05.set_disabled(false)
	if GlobalVar.level6 == true:
		$LevelPanel/ScrollContainer/VBoxContainer/Level_06.set_disabled(false)
	pass

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


func _on_Level1_pressed():
	GlobalVar.targetLevel = 1
	get_tree().change_scene("Level 1.tscn")
	pass # Replace with function body.


func _on_Level2_pressed():
	GlobalVar.targetLevel = 2
	get_tree().change_scene("Level 2.tscn")
	pass # Replace with function body.


func _on_Level3_pressed():
	GlobalVar.targetLevel = 3
	get_tree().change_scene("Level 3.tscn")
	pass # Replace with function body.


func _on_Level4_pressed():
	GlobalVar.targetLevel = 4
	get_tree().change_scene("Level 4.tscn")
	pass # Replace with function body.


func _on_Level5_pressed():
	GlobalVar.targetLevel = 5
	get_tree().change_scene("Level 5.tscn")
	pass # Replace with function body.


func _on_Level6_pressed():
	GlobalVar.targetLevel = 6
	get_tree().change_scene("Level 6.tscn")
	pass # Replace with function body.
