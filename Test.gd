extends Node

var time = 0.0
var cooldown = 6.0

func _ready():
	$Progress.value = 100
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		pass
	pass

func _on_Progress_value_changed(value):
	pass # Replace with function body.
