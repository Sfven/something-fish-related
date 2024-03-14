extends Node2D

#Constant Variables
const RIGHTMOST = 1200
const LEFTMOST = 300 #left border of the water
const TOPMOST = 300 #to keep under the water
const BOTTOMMOST = 650

#fish object variables
var coords_fish: Array = [[0.0, 0.0], [-15,10], [-30,0], [-15,-10]] #drawing Fish #make Bigger
var drawn_fish: PackedVector2Array
var speed = 0 #reintializes in Background
var x_start = randi_range(LEFTMOST,RIGHTMOST)
var y_start = randi_range(TOPMOST,BOTTOMMOST)
var direction = Vector2(x_start,y_start)

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _draw():
	drawn_fish = float_array_to_Vector2Array(coords_fish)
	draw_polygon(drawn_fish,[Color.CRIMSON])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move the fish based on the next location
	move_fish(direction)
	
#fish rotate
func rotate_fish(target):
	var angle_to_target = global_position.direction_to(target).angle() #if angle_to_target is (-pi/2 pi/2) need to reflect fish
	rotation = lerp_angle(rotation,angle_to_target,get_process_delta_time())

#Move fish from point to target_point
func move_fish(target_point):
	
	rotate_fish(target_point)
	
	if position == target_point:
		var rand_x = randi_range(LEFTMOST,RIGHTMOST)
		var rand_y = randi_range(TOPMOST,BOTTOMMOST)
		direction = Vector2(rand_x,rand_y)
	else:
		position = position.move_toward(target_point,get_process_delta_time() * speed)
