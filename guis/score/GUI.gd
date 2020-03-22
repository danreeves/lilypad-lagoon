extends RichTextLabel

func _process(_dt):
	var score = Lotad.get_num_flowers()
	set_text("score: %d" % score)
