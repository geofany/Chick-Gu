extends Panel

func _ready():
	hide()

func _on_Play_pressed():
	get_tree().paused = false
	get_tree().change_scene("Level 1.tscn")

func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("MainMenu.tscn")
