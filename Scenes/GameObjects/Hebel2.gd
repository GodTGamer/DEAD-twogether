extends Node2D

var hebel = false
var hebel_stuck = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zombie_beim_kasten = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if zombie_beim_kasten and hebel and hebel_stuck:
		get_tree().call_group("strom", "aus_2")


func _input(event):
	if Input.is_action_pressed("interaktion"):
		hebel = true

func _on_HebelArea2D_body_entered(body):
	zombie_beim_kasten = true
#	if hebel and hebel_stuck:
#		print("Hebel 2 betätigt")
#		get_tree().call_group("strom", "aus_2")

		


func _on_HebelArea2D_body_exited(body):
	zombie_beim_kasten = false
	hebel = false
	get_tree().call_group("reset", "reset")

func hat_hebel_stuck():
	$Hebelstuck.show()
	hebel_stuck = true

func reset():
	hebel = false
