extends Node2D

var back_to_normal = false
onready var s = $body/s
onready var base_scale = s.scale

func _ready():
	$body.set_angular_velocity(rand_range(-10,10))
	$body.rotation_degrees = rand_range(0,360)
	s.texture = load("res://assets/texture/ball_"+str(int(rand_range(1,5)))+".png")