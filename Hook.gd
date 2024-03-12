@tool
extends Sprite2D

const GRAVITY = 9.8
const HOOK_ORIGIN = Vector2(368,148)
var hook_location = Vector2(368, 148)
var velocity = Vector2(0, 0)
var cast = false
var fishing = false
var reel = false
var hook = preload("res://Assets/hook.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cast"):
		cast = true
		fishing = true
		velocity.x = 2
		velocity.y = 2
	if Input.is_action_just_pressed("ui_reel"):
		reel = true
	else:
		reel = false
	if Input.is_action_just_pressed("ui_cancel"):
		velocity.x = 0
		velocity.y = 0
		hook_location = HOOK_ORIGIN
	
	if(hook_location.y >= 300 && cast):
		velocity.x = 0
		velocity.y = 0.01
		cast = false
	if(cast):
		velocity.x = 2
	if(hook_location.y >= 300 && fishing):
		velocity.x = 0
		velocity.y += delta * GRAVITY * 0.5
	if(hook_location.y < 300 && fishing && !cast):
		velocity.x = 0
		velocity.y += delta * GRAVITY
	if(reel):
		if(hook_location.x < HOOK_ORIGIN.x):
			velocity.x += 0.1
		if(hook_location.x > HOOK_ORIGIN.x):
			velocity.x += -0.1
		if(hook_location.y < HOOK_ORIGIN.y):
			velocity.y += 0.1
		if(hook_location.y > HOOK_ORIGIN.y):
			velocity.y += -0.1
		
	if(hook_location == HOOK_ORIGIN):
		fishing = false
	
	hook_location += velocity
	queue_redraw()
	pass
	
	
func _draw():
	draw_set_transform(hook_location, 0.0, Vector2(0.07, 0.07))
	draw_texture(hook, Vector2(-100, 0))
	#draw_set_transform(Vector2(100, 100), PI / 2.0, Vector2(1, 1))
	#draw_texture(hook, Vector2(0, 0))
	#draw_set_transform(Vector2(200, 200), PI, Vector2(2, 2))
	#draw_texture(hook, Vector2(0, 0))
