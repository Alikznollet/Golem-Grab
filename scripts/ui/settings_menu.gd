extends CanvasLayer

@onready var fullscreen: CheckButton = $VBoxContainer/Fullscreen

func _ready():
	fullscreen.button_pressed = Settings.fullscreen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 20 * delta

func _on_fullscreen_pressed():
	Settings.fullscreen = fullscreen.button_pressed

func _on_back_pressed():
	var scene: PackedScene = load("res://scenes/ui/menu/menu_screen.tscn")
	Settings.save_settings()
	SceneTransition.change_scene(scene)
