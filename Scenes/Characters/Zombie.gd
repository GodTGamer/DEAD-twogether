extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 500
const GRAVITY = 150
const UP = Vector2(0, -1)
const JUMP_SPEED = 1500
const BOOST_MULTIPLIER = 1.2

onready var active = false

onready var animation = $AnimatedSprite

#var laufen = false

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	motion = move_and_slide(motion, UP)
#	if motion.x > 0:
#		$FootstepPlayer.play()
#	else:
#		$FootstepPlayer.stop()
	
	
func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if active:
		if Input.is_action_pressed("up") and is_on_floor():
			motion.y -= JUMP_SPEED
			animation.play("idle")

func move():
	if active:
		if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
			motion.x = -SPEED
			animation.flip_h = true
			animation.play("walk")
			$StepTimer.start()
#			laufen = true
			#$FootstepPlayer.play()
			if $StepTimer.is_stopped():
				$FootstepPlayer.play()
				$StepTimer.start(0.2)
		elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
			motion.x = SPEED
			animation.flip_h = false
			animation.play("walk")
			$StepTimer.start()
#			laufen = true
			#$FootstepPlayer.play()
			if $StepTimer.is_stopped():
				$FootstepPlayer.play()
				$StepTimer.start(0.2)
		else:
			motion.x = 0
			animation.play("idle")
#			laufen = false
			
		if Input.is_action_pressed("interaktion"):
			$HitPlayer.play()
			
		


func boost():
	position.y -= 1
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER


func _on_StepTimer_timeout():
	pass
#	$FootstepPlayer.play()
