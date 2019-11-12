extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVar.makan == 0:
		if GlobalVar.makanan:
			Input.set_custom_mouse_cursor(null)
			GlobalVar.makanan = false
	if GlobalVar.minum == 0:
		if GlobalVar.minuman:
			Input.set_custom_mouse_cursor(null)
			GlobalVar.minuman = false
	if GlobalVar.vaks == 0:
		if GlobalVar.vaksin:
			Input.set_custom_mouse_cursor(null)
			GlobalVar.vaksin = false
	pass


func _on_makanan_pressed():
	if GlobalVar.makan > 0:
		Input.set_custom_mouse_cursor(load('res://Assets/Makanan cursor.png'))
		GlobalVar.makanan = true
		
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.get_button_index()== BUTTON_RIGHT and event.is_pressed():
			Input.set_custom_mouse_cursor(null)
			GlobalVar.makanan = false
			GlobalVar.minuman = false
			GlobalVar.vaksin = false

func _on_air_pressed():
	if GlobalVar.minum > 0:
		Input.set_custom_mouse_cursor(load('res://Assets/Water cursor.png'))
		GlobalVar.minuman = true
	pass # Replace with function body.


func _on_vaksin_pressed():
	if GlobalVar.vaks > 0:
		Input.set_custom_mouse_cursor(load('res://Assets/Vaksin cursor.png'))
		GlobalVar.vaksin = true
	pass # Replace with function body.
