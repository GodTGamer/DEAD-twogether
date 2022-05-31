extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Area2D_body_entered(body):
#	if body.name == "Zombie":
#		get_tree().change_scene("res://Scenes/Level/Level1.tscn")


func _on_ZombieNPCArea2D_body_entered(body):
	if body.name == "Zombie":
		get_tree().change_scene("res://Scenes/Level/Level1.tscn")
#	if body.name == "Chandelier":
#		body.queue_free()
