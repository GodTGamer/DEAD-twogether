extends Area2D

export var Level = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var door_key = false
export var rat_away = false
export var master_key = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TransitionDoor_body_entered(body):
	#"res://Scenes/Level/Level2.tscn"
	if door_key and rat_away and master_key:
		get_tree().change_scene(Level)
		print("Level2")


func open_door():
	door_key = true
	
func rats_scream():
	rat_away = true

func key_away():
	$Tor_Abgeschlossen.queue_free()
	master_key = true
