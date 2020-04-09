extends CanvasLayer

var player: Lotad = null
var text_node: RichTextLabel = null

func set_player(p: Lotad) -> void:
	player = p

func _ready() -> void:
	text_node = find_node("Score")

func _process(_dt):
	if not player:
		pass
	var score = player.get_num_flowers()
	text_node.set_text("score: %d" % score)
