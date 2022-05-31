extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2(0, 0)

onready var scream_chandelier = false
var fall = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_gravity_scale(0)
	pass
	

func _physics_process(delta):
	if scream_chandelier and fall:
		#set_gravity_scale(1)
		#set_sleeping(false)
		#set_linear_velocity()
		motion.y += 500
		motion = move_and_slide(motion)
	#else:
		#set_sleeping(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if Input.is_action_pressed("ghost_scream"):
		scream_chandelier = true
#	else:
#		scream_chandelier = false

func _on_Area2D_body_entered(body):
	print(body.name)
#	if body.name == "ZombieNPC":
#		body.queue_free()
	if body.name == "Ghost":
		fall = true
	


func _on_Area2D_area_entered(area):
	print(area.name)
	if area.name == "ZombieNPCArea2D":
		area.queue_free()
		queue_free()

func reset():
	scream_chandelier = false
