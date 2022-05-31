extends Node2D

var key = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#animation.play("Loch")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var rat_temp = $Rats.ghost_scream
	#rat_temp = false
	#$Chandelier.scream_chandelier = false
	pass

func _input(event):
	if Input.is_action_pressed("switch_character"):
		var temp_state = $Zombie.active
		$Zombie.active = $Ghost.active
		$Ghost.active = temp_state
#	if Input.is_action_pressed("ghost_scream"):
#		var scream_state = $Ghost.scream
#		$Ghost.scream = $Rats.ghost_scream
#		$Rats.ghost_scream = scream_state


func _on_Area2D_body_entered(body):
	#body.queue_free()
	get_tree().change_scene("res://Scenes/Level/Level1.tscn")


func _on_AreaRats_body_entered(body):
	body.queue_free()
	print("Im Free")
	

func key_taken():
	get_tree().call_group("door", "open_door")
	key = true
	
func rats_animation():
	animation.play("Loch")


func _on_AreaRats_area_entered(area):
	area.queue_free()
	$Rats.queue_free()


#func _on_Timer_timeout():
#	$Rats.scream_rats= false
#	$Chandelier.scream_chandelier = false


func _on_RatDeadArea2D_area_entered(area):
	$Rats.queue_free()
