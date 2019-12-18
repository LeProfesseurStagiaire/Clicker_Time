extends Node2D

var back_to_normal = false
onready var s = $s
onready var base_scale = s.scale
onready var rot = rand_range(-5,5)

func _ready():
	$s.rotation_degrees = rand_range(0,360)
	$s.texture = load("res://assets/texture/ball_"+str(int(rand_range(1,5)))+".png")

func _process(delta):
	position.y += 2
	rotation_degrees += rot
	
func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()