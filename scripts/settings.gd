extends Node

var fullscreen: bool
var resolution: Vector2i

func _ready():
	_load_config()
	
func _load_config():
	var config: ConfigFile = ConfigFile.new()
	
	var err = config.load("res://config.cfg")
	
	if err != OK:
		return
		
	fullscreen = config.get_value("settings", "fullscreen")
	resolution = config.get_value("settings", "resolution")
		
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(resolution)
		
func save_settings():
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(resolution)
		
	var config: ConfigFile = ConfigFile.new()
	config.set_value("settings", "fullscreen", fullscreen)
	config.set_value("settings", "resolution", resolution)
	config.save("res://config.cfg")
	
