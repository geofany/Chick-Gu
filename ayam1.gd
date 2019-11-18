extends Button

var animation_ayam
var HP = 70.0
var status = "Normal"
var kipas
var lampu
var mood
var sudahMati = false

func _ready():
	HP = 70.0
	animation_ayam = get_child(0)
	kipas = "Off"
	lampu = "Off"
	GlobalVar.cuaca = "Panas"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVar.cuaca == "Panas" && kipas == "Off" || GlobalVar.cuaca == "Panas" && lampu == "On":
		mood = "Buruk"
	elif GlobalVar.cuaca == "Hujan" && lampu == "Off" || GlobalVar.cuaca == "Hujan" && kipas == "On":
		mood = "Buruk"
	else:
		mood = "Bagus"
	get_node("HPBar").value = HP
	if HP > 100:
		HP = 100
		
	if status == "Sakit" && HP == 0:
		status = "Mati"
		change_status(status)
	elif status == "Sakit":
		change_status(status)
	else :
		if HP > 70:
			status = "Senang"
			change_status(status)
		elif HP > 40:
			status = "Normal"
			change_status(status)
		elif HP > 0:
			status = "Marah"
			change_status(status)
		else:
			status = "Mati"
			change_status(status)
	if status == "Mati" and not sudahMati:
		GlobalVar.mati += 1
		if GlobalVar.mati == 2:
			lampu("Off")
			kipas("Off")
		#queue_free()
		sudahMati = true
	pass
	
func change_status(status):
	animation_ayam.play(status)


func _on_ayam1_pressed():
	if status != "Mati":
		if GlobalVar.makanan == true && status != "Sakit":
			GlobalVar.makan -= 1
			if GlobalVar.makan == 0:
				get_node("/root/Level 1/MakananTimer").start(5)
				get_node("/root/Level 1/Tools/makanan/makan").play("cooldown")
			HP += 20
		if GlobalVar.minuman == true && status != "Sakit":
			GlobalVar.minum -= 1
			if GlobalVar.minum == 0:
				get_node("/root/Level 1/MinumanTimer").start(5)
				get_node("/root/Level 1/Tools/Air/air").play("cooldown")
			HP += 10
		if GlobalVar.vaksin == true && status == "Sakit":
			GlobalVar.vaks -= 1
			if GlobalVar.vaks == 0:
				get_node("/root/Level 1/VaksinTimer").start(5)
				get_node("/root/Level 1/Tools/vaksin/Vaksin").play("cooldown")
			status = "Normal"
			if HP > 50:
				HP = 50
	
	pass # Replace with function body.


func _on_HPTimer_timeout():
	if HP > 0:
		if status == "Sakit" && mood == "Buruk":
			HP -=5
		elif status == "Sakit" || mood == "Buruk":
			HP -=2
		else:
			HP -=1
	if HP < 0:
		HP = 0
	pass # Replace with function body.


func _on_SakitTimer_timeout():
	randomize()
	var t = rand_range(0,100)
	get_node("SakitTimer").start(t)
	if status != "Mati":
		status = "Sakit"
	pass # Replace with function body.


func kipas(status):
	if status == "On":
		get_node("../Bk1/k1").play()
		kipas = status
	else:
		get_node("../Bk1/k1").stop()
		kipas = status

func lampu(status):
	if status == "On":
		get_node("../BL1/L1").frame = 1
		lampu = status
	else:
		get_node("../BL1/L1").frame = 0
		lampu = status

func _on_Bk1_toggled(button_pressed):
	if button_pressed:
		kipas("On")
	else :
		kipas("Off")
	pass # Replace with function body.

func _on_BL1_toggled(button_pressed):
	if button_pressed:
		lampu("On")
	else:
		lampu("Off")
	pass # Replace with function body.