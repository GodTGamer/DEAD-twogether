extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation = $AnimationPlayer
onready var animation2 = $AnimationPlayer2 
onready var animation3 = $BaumAnimationPlayer
onready var positionbaum = $BaumPoint.position

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
	animation.play("Rat_Go")
	animation2.play("Rat_go_2")
	
func do_animation():
	animation3.play("baum")
	show_baum()


func show_baum():
	var baum = load("res://Scenes/GameObjects/BaumLiegt.tscn")
	var insta = baum.instance()
	add_child(insta)
	insta.position = positionbaum


func _on_RatDeadArea2D_area_entered(area):
	$Rats.queue_free()
