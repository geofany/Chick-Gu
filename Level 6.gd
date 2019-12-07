extends Control

var cuaca

func _ready():
	GlobalVar.makan = 6
	GlobalVar.minum = 6
	GlobalVar.vaks = 6
	GlobalVar.targetLevel = 6
	GlobalVar.currentLevel = 6
	$Win.hide()
	$GameOver.hide()
	$PauseMenu.hide()
	$ScrollContainer.get_h_scrollbar().hide()
	
	GlobalVar.hidup = 0
	GlobalVar.mati = 0
	if GlobalVar.targetLevel != 1:
		get_tree().paused = false
	GlobalVar.time = 60.0
	cuaca = "panas"

func _process(delta):
	GlobalVar.time -= delta
	if GlobalVar.time <= 1:
		get_tree().paused = true
		GlobalVar.makanan = false
		GlobalVar.minuman = false
		GlobalVar.vaksin = false
		Input.set_custom_mouse_cursor(null)
		$Win.show()
	
	GlobalVar.hidup = get_tree().get_nodes_in_group("chickens").size() - GlobalVar.mati
	if GlobalVar.hidup  <= get_tree().get_nodes_in_group("chickens").size()/2:
		get_tree().paused = true
		print("Game Over")
		$GameOver.show()
	
	if get_tree().paused:
		$HUD.hide()
	else:
		$HUD.show()
	

func randomly(inputan):
	return inputan[randi() % inputan.size()]

func _on_CuacaTimer_timeout():
	randomize()
	var x = randomly([0,1])
	if x == 0:
		GlobalVar.cuaca = "Panas"
	else:
		GlobalVar.cuaca = "Hujan"
	get_node("/root/Level 6/Background").play(GlobalVar.cuaca)
	var t = rand_range(0,100)
	get_node("/root/Level 6/CuacaTimer").start(t)

func _on_SakitTimer_ready():
	pass # Replace with function body.

func _on_MakananTimer_timeout():
	GlobalVar.makan = 6
	get_node("/root/Level 6/Tools/makanan/makan").play("idle")
	pass # Replace with function body.

func _on_MinumanTimer_timeout():
	GlobalVar.minum = 6
	get_node("/root/Level 6/Tools/Air/air").play("idle")
	pass # Replace with function body.

func _on_VaksinTimer_timeout():
	GlobalVar.vaks = 6
	get_node("/root/Level 6/Tools/vaksin/Vaksin").play("idle")
	pass # Replace with function body.

func _on_PauseButton_pressed():
	$PauseMenu.show()
	get_tree().paused = true

func _on_Continue_pressed():
	$PauseMenu.hide()
	get_tree().paused = false

func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("MainMenu.tscn")
