extends RichTextLabel

func _process(_dt):
	var velocity = Lotad.get_vel()
	set_text("vel: %.2f" % [velocity])
