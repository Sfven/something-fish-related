@tool
extends Node2D

func _process(delta):
	queue_redraw()
	pass

var coords_sand : Array = [
	[ 0, 550], [ 50, 550 ],
	[ 80,550 ], [ 140, 575 ],
	[ 170, 580 ], [ 200, 585 ],
	[ 220, 590 ], [ 240, 600 ],
	[ 260, 610 ], [ 280, 630 ],
	[ 300, 670], [350, 700 ],
	[ 400, 720 ], [ 0, 720 ]]

var sand : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _draw():
	draw_rect(Rect2(0.0,0.0,1280,720),Color8(151,208,209,255))
	draw_rect(Rect2(0.0,300.0,1280,420),Color8(0,106,148,255))
	
	sand = float_array_to_Vector2Array(coords_sand)
	draw_polygon(sand, [Color8(243, 231, 189, 255)])
	
	draw_rect(Rect2(50,250.0,30, 375),Color8(166,94,53,255))
	draw_circle(Vector2(65, 625), 15, Color8(166,94,53,255))
	draw_rect(Rect2(225,250.0,30, 410),Color8(166,94,53,255))
	draw_circle(Vector2(240, 660), 15, Color8(166,94,53,255))
	draw_rect(Rect2(0.0,250.0,300,35),Color8(166,94,53,255))
	draw_circle(Vector2(300,267.5), 17.5, Color8(166,94,53,255))

