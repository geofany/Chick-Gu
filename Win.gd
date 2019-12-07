extends Panel

func _ready():
	GlobalVar.save_game()

func _process(delta):
	if GlobalVar.currentLevel == 6:
		$VBoxContainer/NextLevel.hide()
	else:
		$VBoxContainer/NextLevel.show()

func _on_NextLevel_pressed():
	var nextLvl = GlobalVar.currentLevel  + 1
	var next = "Level %d.tscn" % nextLvl
	get_tree().change_scene(next)

func _on_Exit_pressed():
	get_tree().change_scene("MainMenu.tscn")
