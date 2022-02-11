extends KinematicBody2D

const UP = Vector2(0,-1)
const Gravity = 10
const MFallSpeed = 500
var motion = Vector2()
var side = 2

func _ready():
	pass

func _physics_process(delta):
	if is_on_wall():
		side = side+2
	else:
		motion.x = side * 20
	if side > 2:
		side = -1
	if motion.y < MFallSpeed:
		motion.y += Gravity
	$JeZ.flip_h = side+1
	motion = move_and_slide(motion,UP)
