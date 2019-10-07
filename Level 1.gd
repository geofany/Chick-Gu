extends Control

var cuaca

func _ready():
	$ScrollContainer.get_h_scrollbar().hide()
	cuaca = "panas"
	pass # Replace with function body.

func _process(delta):

	pass


			

func randomly(inputan):
	return inputan[randi() % inputan.size()]

func _on_CuacaTimer_timeout():
	randomize()
	var x = randomly([0,1])
	print(x)
	if x == 0:
		GlobalVar.cuaca = "Panas"
	else:
		GlobalVar.cuaca = "Hujan"
	get_node("/root/Level 1/Background").play(GlobalVar.cuaca)
	var t = rand_range(0,100)
	get_node("/root/Level 1/CuacaTimer").start(t)
	pass # Replace with function body.


func _on_SakitTimer_ready():
	
	pass # Replace with function body.
