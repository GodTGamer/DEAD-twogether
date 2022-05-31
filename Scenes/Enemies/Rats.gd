extends Node2D

var ghost = false
onready var scream_rats = false
export var level_respawn = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#signal scream_rats_signal


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scream_rats and ghost:
		print("gfffffffff")
		$RatSqueekingPlayer.play()
		#animations code
		get_tree().call_group("key", "rats_animation")
		get_tree().call_group("door", "rats_scream")
		
		
func _input(event):
	if Input.is_action_pressed("ghost_scream"):
#		emit_signal("scream_rats_signal")
		scream_rats = true
		print("screammm")



func _on_Area2D_body_entered(body):
	if body.name == "Zombie":
		get_tree().change_scene(level_respawn)


func _on_AreaGhost_body_entered(body):
	if body.name == "Ghost":
		print("ghost entered")
		ghost = true


func _on_AreaGhost_body_exited(body):
	if body.name == "Ghost":
		ghost = false
		get_tree().call_group("reset", "reset")
		
func reset():
	scream_rats = false
