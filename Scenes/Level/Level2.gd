extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation = $AnimationPlayer
onready var positionleiter = $LeiterPosition.position
onready var positionfenster = $HebelTeilPosition.position
onready var animationmast = $StrommastVorneBlitz
onready var kranstromanimation = $KranStromAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_pressed("switch_character"):
		var temp_state = $Zombie.active
		$Zombie.active = $Ghost.active
		$Ghost.active = temp_state

func rats_animation():
	animation.play("RatsExit")


func _on_DeathArea_area_entered(area):
	area.queue_free()
	$Rats.queue_free()
	
func show_leiter():
	var leiter = load("res://Scenes/GameObjects/Leiter.tscn")
	var insta = leiter.instance()
	add_child(insta)
	insta.position = positionleiter
	
func show_hebel_teil():
	var leiter = load("res://Scenes/GameObjects/HebelTeil.tscn")
	var insta = leiter.instance()
	add_child(insta)
	insta.position = positionfenster
	
func animation_mast():
	animationmast.play("strom_aus")
	
func kran_animation():
	kranstromanimation.queue_free()
