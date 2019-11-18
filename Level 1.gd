extends Control

var cuaca

func _ready():
	if GlobalVar.targetLevel != 1:
		get_tree().paused = false
	$ScrollContainer.get_h_scrollbar().hide()
	$GameOver.hide()
	$PauseMenu.hide()
	GlobalVar.time = 151.0
	cuaca = "panas"

func _process(delta):
	if get_tree().paused:
		$HUD.hide()
	else:
		$HUD.show()
	
	GlobalVar.time -= delta
	GlobalVar.hidup = get_tree().get_nodes_in_group("chickens").size() - GlobalVar.mati
	
	if GlobalVar.time <= 1:
		get_tree().change_scene("MainMenu.tscn")
	
	if GlobalVar.hidup  == 0:
		get_tree().paused = true
		print("Game Over")
		$GameOver.show()

func randomly(inputan):
	return inputan[randi() % inputan.size()]

func _on_CuacaTimer_timeout():
	randomize()
	var x = randomly([0,1])
	if x == 0:
		GlobalVar.cuaca = "Panas"
	else:
		GlobalVar.cuaca = "Hujan"
	get_node("/root/Level 1/Background").play(GlobalVar.cuaca)
	var t = rand_range(0,100)
	get_node("/root/Level 1/CuacaTimer").start(t)

func _on_SakitTimer_ready():
	pass # Replace with function body.

func _on_MakananTimer_timeout():
	GlobalVar.makan = 1
	get_node("/root/Level 1/Tools/makanan/makan").play("idle")
	pass # Replace with function body.

func _on_MinumanTimer_timeout():
	GlobalVar.minum = 1
	get_node("/root/Level 1/Tools/Air/air").play("idle")
	pass # Replace with function body.

func _on_VaksinTimer_timeout():
	GlobalVar.vaks = 1
	get_node("/root/Level 1/Tools/vaksin/Vaksin").play("idle")
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
