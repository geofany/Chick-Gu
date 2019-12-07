extends Node

func _ready():
	var scene  = load("res://Tutorial.tscn")
	var scene_instance = scene.instance()
	add_child(scene_instance)
	pass

func _process(delta):
	pass