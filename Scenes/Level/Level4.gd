extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if Input.is_action_pressed("switch_character"):
		var temp_state = $Zombie.active
		$Zombie.active = $Ghost.active
		$Ghost.active = temp_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GrabArea2D_body_entered(body):
	$Sprechblase.hide()
	$BlackTransitionPlayer.play("Fade")
	$TransitionTimer.start()


func _on_TransitionTimer_timeout():
	get_tree().change_scene("res://Scenes/GUI/Menu.tscn")
