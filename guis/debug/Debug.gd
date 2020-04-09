extends CanvasLayer

var player: Lotad = null
var text_node: RichTextLabel = null

func _ready() -> void:
	text_node = find_node("RichTextLabel")

func set_player(p: Lotad) -> void:
	player = p

func _process(_dt):
	if player:
		# warning-ignore:unsafe_property_access
		# warning-ignore:unsafe_property_access
		text_node.set_text("velocity: %.4f\nrotational velocity: %.4f" % [player.velocity, player.rotation_velocity])
