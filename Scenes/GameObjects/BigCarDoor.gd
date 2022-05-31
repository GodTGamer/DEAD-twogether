extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var open_door = false
var car_key = false

var zombie_bei_autotur = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if open_door and car_key and zombie_bei_autotur:
		get_tree().call_group("key", "show_leiter")
		queue_free()


func _input(event):
	if Input.is_action_pressed("interaktion"):
		open_door = true

func _on_BigCarDoorArea_body_entered(body):
	zombie_bei_autotur = true
#	if open_door and car_key:
#		get_tree().call_group("key", "show_leiter")
#		queue_free()


func _on_BigCarDoorArea_body_exited(body):
	zombie_bei_autotur = false
	open_door = false
	get_tree().call_group("reset", "reset")
	
func hat_car_key():
	car_key = true
	
func reset():
	open_door = false
