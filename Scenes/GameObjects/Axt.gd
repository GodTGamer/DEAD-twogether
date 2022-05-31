extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var taken = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AxtArea2D_body_entered(body):
	if not taken and body.name == "Zombie":
		print(body.name)
		get_tree().call_group("axt", "axt_taken")
		get_tree().call_group("door", "key_away")
		queue_free()
