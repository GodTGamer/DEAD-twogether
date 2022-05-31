extends Node2D

var kill = false
onready var hit_spider = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if Input.is_action_pressed("interaktion"):
		hit_spider = true

func _on_Area2D_body_entered(body):
	#body.motion = body.motion * 100
	print("Zombie ist bei Spinne")
	if hit_spider and body.name == "Zombie":
		print(body.name)
		print("schlag spinne")
		#get_tree().call_group("reset", "reset")
		queue_free()
		
func reset():
	hit_spider = false


func _on_Area2D_body_exited(body):
	get_tree().call_group("reset", "reset")
