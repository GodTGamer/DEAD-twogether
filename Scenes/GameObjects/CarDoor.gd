extends StaticBody2D

var bruch = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zombie_beim_fenster = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if zombie_beim_fenster and bruch:
		$GlassBreackingPlayer.play()
		get_tree().call_group("key", "show_hebel_teil")
		queue_free()

func _input(event):
	if Input.is_action_pressed("interaktion"):
		bruch = true

func _on_Area2D_body_entered(body):
	if body.name == "Zombie":
		zombie_beim_fenster = true
#		$GlassBreackingPlayer.play()
#		get_tree().call_group("key", "show_hebel_teil")
#		queue_free()


func _on_Area2D_body_exited(body):
	zombie_beim_fenster = false
	bruch = false
	get_tree().call_group("reset", "reset")
	

	
func reset():
	bruch = false
