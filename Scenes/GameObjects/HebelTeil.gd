extends Node2D

var taken = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HebelTeilArea_body_entered(body):
	if not taken and body.name == "Zombie":
		print(body.name)
		print("Hebelteil aufgenomen")
		get_tree().call_group("hebel", "hat_hebel_stuck")
		queue_free()
