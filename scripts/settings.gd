extends Node

var fullscreen: bool
var dimension_x: int
var dimension_y: int

func _ready():
	_load_config()
	
func _load_config():
	var config: ConfigFile = ConfigFile.new()
	
	var err = config.load("res://config.cfg")
	
	if err != OK:
		return
		
	fullscreen = config.get_value("settings", "fullscreen")
	dimension_x = config.get_value("settings", "dimension_x")
	dimension_y = config.get_value("settings", "dimension_y")
		
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(Vector2i(dimension_x, dimension_y))
		DisplayServer.window_set_position(Vector2i.ZERO)
		DisplayServer.window_set_current_screen(0)
		
func save_settings():
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(Vector2i(dimension_x, dimension_y))
		DisplayServer.window_set_position(Vector2i.ZERO)
		DisplayServer.window_set_current_screen(0)
		
	var config: ConfigFile = ConfigFile.new()
	config.set_value("settings", "fullscreen", fullscreen)
	config.set_value("settings", "dimension_x", dimension_x)
	config.set_value("settings", "dimension_y", dimension_y)
	config.save("res://config.cfg")
	
