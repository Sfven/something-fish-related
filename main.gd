@tool
extends Node2D

func _process(_delta):
	queue_redraw()
	pass

var coords_head : Array = [
	[ 0, 500],  [ 5, 570 ],
	[ 10,590 ], [ 15,600 ],
	[ 20,610 ],  [ 25,620 ],
	[ 30,630 ], [ 35,640 ],
	[40,650], [45,660 ],
	[ 50,670 ],  [55,680],
	[60,690 ],  [65,700],
	[ 70,700 ],  [ 75,700 ],
	[ 80,710 ],  [ 85, 720 ],
	[ 0,720 ]
]

var head : PackedVector2Array

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _draw():
	draw_rect(Rect2(0.0,0.0,1280,720),Color8(151,208,209,255))
	draw_rect(Rect2(0.0,250.0,300,35),Color8(166,94,53,255))
	draw_circle(Vector2(300,267.5), 17.5, Color8(166,94,53,255))
	draw_rect(Rect2(50,250.0,30, 375),Color8(166,94,53,255))
	draw_rect(Rect2(225,250.0,30, 410),Color8(166,94,53,255))
	
	head = float_array_to_Vector2Array(coords_head);
	
	draw_polygon(head, [Color.BLUE])

