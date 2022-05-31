extends RigidBody2D

var taken = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_weight(20.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if not taken and body.name == "Zombie":
		print(body.name)
		get_tree().call_group("key", "key_taken")
		get_tree().call_group("door", "key_away")
		queue_free()

#func delete_key():
#	queue_free()
