extends Spatial

var Flower = load("res://Flower.tscn")

func _ready():
	pass # Replace with function body.

func _process(_dt):
	if find_node("Flower", true, false) != null:
		return
	else:
		var flower = Flower.instance()
		add_child(flower)
		flower.set_name("Flower")
		var x_extents = 35
		var z_extents = 30
		flower.translation = Vector3(
			rand_range(-x_extents, x_extents), 
			0.5, 
			rand_range(-z_extents + 10, z_extents) # +10 fudge for ortho camera
		)
