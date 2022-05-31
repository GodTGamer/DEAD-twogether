extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cut_tree = false
var one = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if Input.is_action_pressed("interaktion"):
		cut_tree = true

func _on_BaumArea_body_entered(body):
	if cut_tree and not one:
		print("Baum fällt")
		get_tree().call_group("baum", "do_animation")
		one = true
		


func _on_BaumArea_body_exited(body):
	get_tree().call_group("reset", "reset")
