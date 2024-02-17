@tool
extends Node2D


func _process(_delta):
	queue_redraw()
	
	

func _draw():
	draw_rect(Rect2(0.0,0.0,1280,720),Color8(151,208,209,255))
	draw_rect(Rect2(0.0,250.0,300,35),Color8(166,94,53,255))
	draw_circle(Vector2(300,267.5), 17.5, Color8(166,94,53,255))
	draw_rect(Rect2(50,250.0,30, 375),Color8(166,94,53,255))
	draw_rect(Rect2(225,250.0,30, 410),Color8(166,94,53,255))
	
