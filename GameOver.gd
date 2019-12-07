extends Panel

func _ready():
	hide()

func _on_Play_pressed():
	get_tree().paused = false
	var lvl = GlobalVar.currentLevel
	var repeat = "Level %d.tscn" % lvl
	get_tree().change_scene(repeat)

func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("MainMenu.tscn")
