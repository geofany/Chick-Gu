extends Node

var isLevelPanelHidden = true

func _ready():
	$PlayerPanel.hide()
	$ResetPanel.hide()
	$AnimationChicken.play("AyamGakJelas")
	$HBoxContainer/Background/Ayam01.play("idle")
	$HBoxContainer/Background/Ayam02.play("idle")
	$HBoxContainer/Background/Ayam03.play("idle")
	isLevelPanelHidden = true
	checkLevel()

func _process(delta):
	pass

func checkLevel():
	for i in range(6):
		var p = get_node("LevelPanel/ScrollContainer/VBoxContainer/Level_0%d" % (i+1))
		if i < GlobalVar.targetLevel:
			p.set_disabled(false)
		else:
			p.set_disabled(true)

# OptionPanel
func _on_Play_pressed():
	#$PlayerPanel.show()
	if isLevelPanelHidden:
		$PlayerPanel.hide()
		$AnimationPanel.play("LevelMenuShow")
		$HBoxContainer/OptionPanel/VBoxContainer/Play.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Reset.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Credits.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Quit.set_disabled(true)
		isLevelPanelHidden = false

func _on_Reset_pressed():
	$ResetPanel.popup()

func _on_Credits_pressed():
	$CreditsPanel.popup()

func _on_Exit_pressed():
	GlobalVar.save_game()
	get_tree().quit()

# PlayerForm
func _on_OK_pressed():
	if isLevelPanelHidden:
		$PlayerPanel.hide()
		$AnimationPanel.play("LevelMenuShow")
		$HBoxContainer/OptionPanel/VBoxContainer/Play.set_disabled(true)
		$HBoxContainer/OptionPanel/VBoxContainer/Reset.set_disabled(true)
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
		$HBoxContainer/OptionPanel/VBoxContainer/Play.set_disabled(false)
		$HBoxContainer/OptionPanel/VBoxContainer/Reset.set_disabled(false)
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

func _on_Reset_OK_pressed():
	GlobalVar.targetLevel = 1
	checkLevel()
	GlobalVar.save_game()
	$ResetPanel.hide()

func _on_Reset_Cancel_pressed():
	$ResetPanel.hide()
