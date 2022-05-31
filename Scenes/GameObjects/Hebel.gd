extends Node2D

var hebel = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zombie_beim_kasten = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if zombie_beim_kasten and hebel:
		get_tree().call_group("strom", "aus")
	

func _input(event):
	if Input.is_action_pressed("interaktion"):
		hebel = true

func _on_HebelArea_body_entered(body):
	zombie_beim_kasten = true
#	if hebel:
#		get_tree().call_group("strom", "aus")


func _on_HebelArea_body_exited(body):
	zombie_beim_kasten = false
#	hebel = false
	get_tree().call_group("reset", "reset")

func reset():
	hebel = false
