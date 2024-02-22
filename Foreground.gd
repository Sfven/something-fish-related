@tool
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass

func _draw():
	draw_rect(Rect2(0.0,300.0,1280,420),Color8(0,102,204,64))
	pass
