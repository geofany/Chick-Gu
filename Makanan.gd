extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_makanan_pressed():
	Input.set_custom_mouse_cursor(load('res://Assets/Makanan cursor.png'))
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.get_button_index()== BUTTON_RIGHT and event.is_pressed():
			Input.set_custom_mouse_cursor(null)

func _on_air_pressed():
	Input.set_custom_mouse_cursor(load('res://Assets/Water cursor.png'))
	pass # Replace with function body.


func _on_vaksin_pressed():
	Input.set_custom_mouse_cursor(load('res://Assets/Vaksin cursor.png'))
	pass # Replace with function body.
