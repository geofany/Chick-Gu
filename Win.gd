extends Panel

func _ready():
	#hide()
	pass

func _process(delta):
	$AnimatedSprite.play("gerak")

func _on_NextLevel_pressed():
	# get_tree().change_scene("Level 2.tscn")
	pass

func _on_Exit_pressed():
	get_tree().change_scene("MainMenu.tscn")
