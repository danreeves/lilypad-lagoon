extends Spatial

var Flower = load("res://Flower.tscn")

func _ready():
	pass # Replace with function body.

func _process(dt):
	if find_node("Flower", true):
		pass
	else:
		var flower = Flower.instance()
		add_child(flower)
