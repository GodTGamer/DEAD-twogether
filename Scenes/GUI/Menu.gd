extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var credits = $CreditScreen
onready var menu = false
export var level = 0
export var gewalter_modus = 0
onready var pfad = ["res://Scenes/Level/Level1.tscn", "res://Scenes/Level/Level2.tscn", "res://Scenes/Level/Level3.tscn", "res://Scenes/Level/Level4.tscn"]
#onready var modus = [get_tree().change_scene(pfad[level]), menu_hider()]


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -25)
	OS.set_window_maximized(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if menu == true:
		show()
		#$Background.show()
		$AnimatedAnimated.show()
		#$CreditScreen.show()
		$CreditsButton.show()
		$MenuBackButton.show()
		$QuitButton.show()
		$StartButton.show()
		$VolumeSlider.show()
		

func _input(event):
	if Input.is_action_pressed("menu"):
		menu = true
		$MenuBackButton.show()

func _on_StartButton_pressed():
	#modus[gewalter_modus]
	get_tree().change_scene(pfad[level])


func _on_CreditsButton_pressed():
	credits.show()


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_BackButton_pressed():
	credits.hide()


func _on_MenuBackButton_pressed():
	print("MenuBackButton pressed")
	#$Background.hide()
	$AnimatedAnimated.hide()
	$CreditScreen.hide()
	$CreditsButton.hide()
	$MenuBackButton.hide()
	$QuitButton.hide()
	$StartButton.hide()
	$VolumeSlider.hide()
	menu = false
	
#func menu_hider():
#	$AnimatedAnimated.hide()
#	$CreditScreen.hide()
#	$CreditsButton.hide()
#	$MenuBackButton.hide()
#	$QuitButton.hide()
#	$StartButton.hide()
#	$VolumeSlider.hide()
#	menu = false
	
