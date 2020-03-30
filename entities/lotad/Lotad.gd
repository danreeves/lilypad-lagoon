extends KinematicBody

export (float) var drag = 0.1
export (float) var max_speed = 0.3
export (float) var max_speed_reverse = 0.1
export (float) var acceleration = 0.6
export (float) var rotation_speed = 1

var Flower = ResourceLoader.load("res://entities/flower/Flower.tscn")
var velocity = 0
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
	var direction = 0
	
	if Input.is_action_pressed("ui_up"):
		velocity -= acceleration * dt
	if Input.is_action_pressed("ui_down"):
		velocity += acceleration * dt
		
	velocity = max(min(velocity, max_speed_reverse), -max_speed)
	velocity = move_toward(velocity, 0, drag * dt)
	
	if Input.is_action_pressed("ui_left"):
		direction = 100 * dt
	if Input.is_action_pressed("ui_right"):
		direction = -100 * dt
	
	rotate_y(deg2rad(direction))
	var move_to = Vector3(0, 0, velocity).rotated(UP, rotation.y)
	
	var collision = move_and_collide(move_to)

	if collision:
		var collider = collision.collider
		if collider.is_in_group("Flowers"):
			num_flowers += 1
			collider.get_parent().remove_child(collider)
