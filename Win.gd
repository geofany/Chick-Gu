extends Panel

func _ready():
	#hide()
	pass



func _on_NextLevel_pressed():
	if GlobalVar.level5 == true && GlobalVar.level4 == true && GlobalVar.level3 == true && GlobalVar.level2 == true && GlobalVar.level1 == true:
		GlobalVar.level6 = true
		GlobalVar.targetLevel = 6
		get_tree().change_scene("Level 6.tscn")
	elif GlobalVar.level4 == true && GlobalVar.level3 == true && GlobalVar.level2 == true && GlobalVar.level1 == true:
		GlobalVar.level5 = true
		GlobalVar.targetLevel = 5
		get_tree().change_scene("Level 5.tscn")
	elif GlobalVar.level3 == true && GlobalVar.level2 == true && GlobalVar.level1 == true:
		GlobalVar.level4 = true
		GlobalVar.targetLevel = 4
		get_tree().change_scene("Level 4.tscn")
	elif GlobalVar.level2 == true && GlobalVar.level1 == true:
		GlobalVar.level3 = true
		GlobalVar.targetLevel = 3
		get_tree().change_scene("Level 3.tscn")
	elif GlobalVar.level1 == true:
		GlobalVar.level2 = true
		GlobalVar.targetLevel = 2
		get_tree().change_scene("Level 2.tscn")
		
	print(GlobalVar.level3)
	pass

func _on_Exit_pressed():
	get_tree().change_scene("MainMenu.tscn")
