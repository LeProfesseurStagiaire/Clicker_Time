extends Node2D

var time = 5
var global_time =0
var time_get = 0.2
var sand_count = 0
var can_sand = true
onready var sand_ball = preload("res://scene/sand.tscn")
onready var sand_ball_background = preload("res://scene/sand_background.tscn")
onready var info_node = preload("res://scene/info.tscn")

func _ready():
	$time.text = str(int(time))
	$global_time.text = str(int(global_time))

func _process(delta):
	time -= 1*delta
	global_time += 1*delta
	$time.text = str(int(time))
	$global_time.text = str(int(global_time))

func _on_TextureButton_pressed():
	time += time_get
	var inf = info_node.instance()
	$info_container.add_child(inf)
	inf.get_node("Label").text = "+"+str(time_get)
	inf.position = Vector2(rand_range(5,480),rand_range(5,200))
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
