@tool
extends Sprite2D

const GRAVITY = 9.8
const HOOK_ORIGIN = Vector2(368,148)
var hook_location = Vector2(368, 148)
var velocity = Vector2(0, 0)
var reelVelocity = Vector2(0, 0)
var cast = false
var fishing = false
var reel = false
var power = 0
var increasePower = true
var throw = 0
var hook = preload("res://Assets/hook_alt.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("ui_cast") && !fishing):
		if increasePower:
			power+=1
		else:
			power-=1
		if power == 912:
			increasePower = false
		if power == 0:
			increasePower = true
	else:
		if (power > 0 && !fishing):
			throw = (power+35)/70
			cast = true
			fishing = true
		if Input.is_action_pressed("ui_reel"):
			reel = true
		else:
			reel = false
		if Input.is_action_just_pressed("ui_cancel"):
			velocity.x = 0
			velocity.y = 0
			hook_location = HOOK_ORIGIN
			power = 0
			cast = false
			fishing = false
			increasePower = true
		
		if(hook_location.y >= 300 && cast):
			velocity.x = 0
			velocity.y = 0
			cast = false
		if(cast):
			velocity.x = throw
			velocity.y += delta * GRAVITY
		if(hook_location.y >= 300 && fishing):
			velocity.x = 0
			velocity.y += delta * GRAVITY*0.2
		if(hook_location.y < 300 && fishing && !cast):
			velocity.x = 0
			velocity.y += delta * GRAVITY
		if(reel):
			reelVelocity.x += -0.002
			reelVelocity.y += -0.002
			if(hook_location.x > 480 && hook_location.y < 300):
				reelVelocity.y = 0.0
			velocity.x = 0
			velocity.y = 0
		else:
			reelVelocity.x = 0
			reelVelocity.y = 0
		if(hook_location == HOOK_ORIGIN && fishing && !cast):
			fishing = false
			power = 0
		if(velocity.y > 1.3 && hook_location.y > 300):
			velocity.y = 1.3
		hook_location += velocity
		hook_location += reelVelocity
		if(hook_location.x < 368):
			hook_location.x = 368
		if(hook_location.y < 148):
			hook_location.y = 148
		if(hook_location.x > 1260):
			hook_location.x = 1260
		if(hook_location.y > 700):
			hook_location.y = 700
	queue_redraw()
	
func _draw():
	var hook_center = Vector2(hook_location.x+3, hook_location.y+1)
	draw_rect(Rect2(368,0,power, 20),Color8(34,139,34,255))
	draw_set_transform(hook_location, 0.0, Vector2(0.1, 0.1))
	draw_texture(hook, Vector2(-20, 0))
	draw_set_transform(Vector2(0,0), 0.0, Vector2(1, 1))
	draw_line(hook_center, HOOK_ORIGIN, Color8(211, 211, 211,200), 2.0, false)
	#draw_set_transform(Vector2(100, 100), PI / 2.0, Vector2(1, 1))
	#draw_texture(hook, Vector2(0, 0))
	#draw_set_transform(Vector2(200, 200), PI, Vector2(2, 2))
	#draw_texture(hook, Vector2(0, 0))
