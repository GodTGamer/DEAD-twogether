extends KinematicBody2D

onready var active = true
onready var scream = false
onready var animation = $AnimatedSprite
#var motion = Vector2(0, 0)
#
#export (int) var SPEED = 1500
#
#func _ready():
#	pass # Replace with function body.
#
#
#
#func _physics_process(delta):
#	move()
#	move_and_slide(motion)
#
#func move():
#	if Input.is_action_just_pressed("left") and not Input.is_action_just_pressed("right"):
#		motion.x = -SPEED
#	elif Input.is_action_just_pressed("right") and not Input.is_action_just_pressed("left"):
#		motion.x = SPEED
#	elif Input.is_action_just_pressed("up") and not Input.is_action_just_pressed("down"):
#		motion.y = -SPEED
#	elif Input.is_action_just_pressed("down") and not Input.is_action_just_pressed("up"):
#		motion.y = SPEED
#	else:
#		motion = 0

############## old
#func _ready():
#	OS.set_window_maximized(true)
#
#export (int) var speed = 400
#
#var velocity = Vector2()
#
#func _physics_process(delta):
#	move()
#	velocity = move_and_slide(velocity)

#func move():
#	velocity = Vector2()
#
#	if active:
#		if Input.is_action_pressed("right"):
#			velocity.x += 1
#		if Input.is_action_pressed("left"):
#			velocity.x -= 1
#		if Input.is_action_pressed("down"):
#			velocity.y += 1
#		if Input.is_action_pressed("up"):
#			velocity.y -= 1
#	velocity = velocity.normalized() * speed
	
##### new
var motion = Vector2(0, 0)

const SPEED = 200
const GRAVITY = 150
const UP = Vector2(0, -1)
const JUMP_SPEED = 3500
const BOOST_MULTIPLIER = 1.2


func _ready():
	OS.set_window_maximized(true)
#	connect("scream_rats_signal", self, "screaming")


var velocity = Vector2()

func _physics_process(delta):
	move()
	motion = move_and_slide(motion)


func move():
	if active:
		if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
			motion.x = -SPEED
			animation.flip_h = true
			animation.play("walk")
		elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
			motion.x = SPEED
			animation.flip_h = false
			animation.play("walk")
		else:
			motion.x = 0
			animation.play("default")

		if Input.is_action_pressed("up") and not Input.is_action_pressed("down"):
			motion.y = -SPEED
		elif Input.is_action_pressed("down") and not Input.is_action_pressed("up"):
			motion.y = SPEED
		else:
			motion.y = 0
			
		if Input.is_action_pressed("ghost_scream"):
			screaming()
	motion = motion.normalized() * SPEED
	
func screaming():
	animation.play("scare")


