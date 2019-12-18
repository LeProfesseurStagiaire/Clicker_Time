extends Node2D

var time = 5
var time_get = 1
var sand_count = 0
var can_sand = true
onready var sand_ball = preload("res://scene/sand.tscn")
onready var sand_ball_background = preload("res://scene/sand_background.tscn")

func _ready():
	$time.text = str(int(time))

func _process(delta):
	time -= 1*delta
	$time.text = str(int(time))

func _on_TextureButton_pressed():
	time += time_get
	if sand_count < 13 && can_sand:
		var s = sand_ball.instance()
		$sand_spawner.add_child(s)
		s.position = Vector2(rand_range(100,500),-10)
		sand_count += 1
		can_sand = false
		$sablier/sand_delay.start(rand_range(0.1,0.6))

func _on_Area2D_body_entered(body):
	if body.is_in_group("sand"):
		body.get_parent().queue_free()
		sand_count -= 1

func _on_sand_delay_timeout():
	can_sand = true

func _on_sand_delay_background_timeout():
	var s = sand_ball_background.instance()
	$sand_spawner.add_child(s)
	s.position = Vector2(rand_range(0,600),0)
	$sablier/sand_delay_background.start(rand_range(0.1,0.5))
