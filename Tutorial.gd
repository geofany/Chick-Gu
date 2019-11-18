extends Panel

onready var picture = $VBoxContainer/TutorialPicture
var target1 = preload("res://Assets/tutorial_01.png")
var target2 = preload("res://Assets/tutorial_02.png")
var target3 = preload("res://Assets/tutorial_03.png")
var target4 = preload("res://Assets/tutorial_04.png")
var target5 = preload("res://Assets/tutorial_05.png")
var target6 = preload("res://Assets/tutorial_06.png")
var page

func _ready():
	page = 1
	get_tree().paused = true

func _process(delta):
	$VBoxContainer/HBoxContainer/Page.text = String(page)
	$VBoxContainer/HBoxContainer/Back.text = "Keluar" if page == 1 else "<- Kembali"
	$VBoxContainer/HBoxContainer/Forward.text = "Mulai!" if page == 6 else "Lanjut ->"
	
	if page == 1:
		picture.texture = target1
	elif page == 2:
		picture.texture = target2
	elif page == 3:
		picture.texture = target3
	elif page == 4:
		picture.texture = target4
	elif page == 5:
		picture.texture = target5
	elif page == 6:
		picture.texture = target6

func _on_Foward_pressed():
	if page == 6:
		get_tree().paused = false
		queue_free()
	else:
		page += 1

func _on_Back_pressed():
	if page == 1:
		get_tree().paused = false
		get_tree().change_scene("MainMenu.tscn")
	else:
		page -= 1
