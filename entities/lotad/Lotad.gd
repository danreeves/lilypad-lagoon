extends KinematicBody
class_name Lotad

export (float) var drag = 0.03
export (float) var max_speed = 0.1
export (float) var max_speed_reverse = 0.05
export (float) var acceleration = 0.6
export (float) var rotation_acceleration = 2
export (float) var max_rotation_velocity = 1
export (float) var rotation_drag = 1

export (float) var velocity = 0
export (float) var rotation_velocity = 0
var num_flowers = 0
var UP = Vector3(0,1,0)

func get_vel():
	return velocity
	
func get_num_flowers():
	return num_flowers

# Called when the node enters the scene tree for the first time.
func _ready():
	num_flowers = 0

func _physics_process(dt):
	
	if Input.is_action_pressed("ui_up"):
		velocity -= acceleration * dt
	if Input.is_action_pressed("ui_down"):
		if velocity >= 0:
			velocity += (acceleration / 10) * dt
		
	velocity = max(min(velocity, max_speed_reverse), -max_speed)
	velocity = move_toward(velocity, 0, drag * dt)
	
	if velocity > 0:
		var reverse_rotation_acceleration = rotation_acceleration * 0.666
		if Input.is_action_pressed("ui_left"):
			rotation_velocity += reverse_rotation_acceleration * dt
		if Input.is_action_pressed("ui_right"):
			rotation_velocity -= reverse_rotation_acceleration * dt
	else:
		if Input.is_action_pressed("ui_left"):
			rotation_velocity += rotation_acceleration * dt
		if Input.is_action_pressed("ui_right"):
			rotation_velocity -= rotation_acceleration * dt
	
	rotation_velocity = max(min(rotation_velocity, max_rotation_velocity), -max_rotation_velocity)
	
	var delta = rotation_drag + (abs(rotation_velocity) * 0.1) + (abs(velocity) * 2.5)
	
	rotation_velocity = move_toward(
		rotation_velocity,
		0,
		delta * dt
	)
	
	rotate_y(deg2rad(rotation_velocity))
	var move_to = Vector3(0, 0, velocity).rotated(UP, rotation.y)
	
	var collision = move_and_collide(move_to)

	if collision:
		var collider = collision.collider
		if collider.is_in_group("Flowers"):
			num_flowers += 1
			collider.get_parent().remove_child(collider)
