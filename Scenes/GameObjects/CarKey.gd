extends RigidBody2D

var taken = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	set_weight(1000.0)
#	set_mass(5.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
#	set_weight(1000.0)
#	set_mass(50.0)


func _on_CarKeyArea_body_entered(body):
	if not taken and body.name == "Zombie":
		print(body.name)
		get_tree().call_group("car", "hat_car_key")
		queue_free()

