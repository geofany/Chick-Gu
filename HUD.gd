extends Panel

func _process(delta):
	get_node("HBoxContainer/Level").text = "Level : " + String(GlobalVar.targetLevel)
	get_node("HBoxContainer/Time").text = "Sisa Waktu : " + String(int(GlobalVar.time)) + " detik"
	get_node("HBoxContainer/Life").text = "Hidup : " + String(GlobalVar.hidup)
	get_node("HBoxContainer/Death").text = "Mati : " + String(GlobalVar.mati)

func _on_Pause_pressed():
	get_tree().paused = true
	get_tree().get_current_scene().get_node("PauseMenu").show()
