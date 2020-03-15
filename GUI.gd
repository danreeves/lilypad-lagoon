extends RichTextLabel

func _process(_dt):
	var vel = Lotad.get_vel()
	var score = Lotad.get_num_flowers()
	set_text("x: %f\nz: %f\nscore: %d" % [vel.x, vel.z, score])
