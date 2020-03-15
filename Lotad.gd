extends KinematicBody

export (float) var drag = 0.5
export (float) var max_speed = 5
export (float) var acceleration = 1.5

var Flower = ResourceLoader.load("res://Flower.tscn")
var velocity = Vector3()
var num_flowers = 0

func get_vel():
	return velocity
	
func get_num_flowers():
	return num_flowers

# Called when the node enters the scene tree for the first time.
func _ready():
	num_flowers = 0
	pass # Replace with function body.

func _process(dt):
	if Input.is_key_pressed(KEY_UP):
		velocity.z -= acceleration * dt
	if Input.is_key_pressed(KEY_DOWN):
		velocity.z += acceleration * dt
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= acceleration * dt
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += acceleration * dt
	
	velocity.x = move_toward(velocity.x, 0, drag * dt)
	velocity.z = move_toward(velocity.z, 0, drag * dt)
		
	if velocity.x > max_speed:
		velocity.x = max_speed
	if velocity.x < -max_speed:
		velocity.x = -max_speed
	if velocity.z > max_speed:
		velocity.z = max_speed
	if velocity.z < -max_speed:
		velocity.z = -max_speed
	
	var collision = move_and_collide(velocity)
	
	if collision:
		var collider = collision.collider
		if collider.is_in_group("Flowers"):
			num_flowers += 1
			collider.get_parent().remove_child(collider)
