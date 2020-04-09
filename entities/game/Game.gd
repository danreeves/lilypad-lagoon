extends Spatial
class_name Game

var Flower = load("res://entities/flower/Flower.tscn")
var Lotad = load("res://entities/lotad/Lotad.tscn")

var player = null

func _ready() -> void:
	player = Lotad.instance()
	# warning-ignore:unsafe_property_access
	find_node("Score").player = player
	# warning-ignore:unsafe_property_access
	find_node("Debug").player = player
	add_child(player)

func _process(_dt) -> void:
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
