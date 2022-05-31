extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func aus_2():
	print("strom aus 2")
	get_tree().call_group("strom_animation", "kran_animation")
	queue_free()

func _on_StromArea2_body_entered(body):
	if body.name == "Ghost":
		get_tree().change_scene("res://Scenes/Level/Level2.tscn")
