extends KinematicBody2D

const UP = Vector2(0,-1)
const Gravity = 10
const MFallSpeed = 500
const MSpeed = 80
const Jump = 180

var motion = Vector2()
var keylr =  0
var spawn = [0,0]
var jumps = 0

func _ready():
	pass

func _physics_process(delta):
	keylr =  int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	motion.x = keylr*MSpeed
	if keylr == 0:
		motion.x = 0
		$Player.frame = 0
	else:
		$Player.flip_h = keylr-1
		if $Player.frame == 0:
			$Player.frame = $Player.frame+1
		else:
			$Player.frame = 0
	if motion.y < MFallSpeed:
		motion.y += Gravity
	if Input.is_action_just_pressed("jump") and jumps > 0:
		motion.y = -Jump
		jumps=jumps-1
	if Input.is_action_pressed("down"):
		motion.y = Jump
	if is_on_floor():
		jumps=1
	motion = move_and_slide(motion,UP)
	
