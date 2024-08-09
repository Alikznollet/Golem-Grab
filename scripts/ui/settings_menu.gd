extends CanvasLayer

var resolutions: Dictionary = {
	"320x180" : 1,
	"1280x720" : 2,
	"1920x1080" : 3
}

@onready var fullscreen: CheckButton = $VBoxContainer/Fullscreen
@onready var resolution: OptionButton = $VBoxContainer/HBoxContainer/OptionButton

func _ready():
	fullscreen.button_pressed = Settings.fullscreen
	for res in resolutions:
		resolution.add_item(res, resolutions[res])
	
	# TODO: make this a lot prettier
	resolution.selected = resolution.get_item_index(
		resolutions[str(Settings.resolution.x) + "x" + str(Settings.resolution.y)]
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 20 * delta

func _on_fullscreen_pressed():
	Settings.fullscreen = fullscreen.button_pressed

func _on_back_pressed():
	var scene: PackedScene = load("res://scenes/ui/menu/menu_screen.tscn")
	Settings.save_settings()
	SceneTransition.change_scene(scene)


func _on_option_button_item_selected(index):
	var item: Array = resolution.get_item_text(index).split("x")
	Settings.resolution = Vector2(int(item[0]), int(item[1]))
