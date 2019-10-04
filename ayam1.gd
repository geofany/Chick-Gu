extends Button

var animation_ayam
var HP = 70.0
var status = "Normal"
var mati = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	HP = 70.0
	animation_ayam = get_child(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("HPBar").value = HP
	print(mati)
	if HP > 100:
		HP = 100

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
		
		return
	pass
	
func change_status(status):
	animation_ayam.play(status)


func _on_ayam1_pressed():
	if status != "Mati":
		if GlobalVar.makanan == true:
			HP += 20
		if GlobalVar.minuman == true:
			HP += 10
	
	pass # Replace with function body.


func _on_HPTimer_timeout():
	if HP > 0:
		HP -=2

	pass # Replace with function body.


func _on_SakitTimer_timeout():
	randomize()
	var t = rand_range(0,100)
	get_node("/root/Level 1/SakitTimer").start(t)
	pass # Replace with function body.
