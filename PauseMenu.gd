extends Panel

func _ready():
	hide()

func _on_Continue_pressed():
	get_tree().paused = false
	hide()

func _on_Quit_pressed():
	get_tree().paused = false
	get_tree().change_scene("MainMenu.tscn")
