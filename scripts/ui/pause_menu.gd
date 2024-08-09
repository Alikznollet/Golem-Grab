extends CanvasLayer

var open: bool

func _ready():
	open = false
	$VBoxContainer.visible = open
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		if !open:
			$VBoxContainer.visible = true
			get_tree().paused = true
			open = !open
		else:
			_resume()
			
			
func _resume():
	get_tree().paused = false
	$VBoxContainer.visible = false
	open = !open


func _on_play_pressed():
	_resume()

func _on_options_pressed():
	pass

func _on_save_quit_pressed():
	# TODO: implement a saving mechanism here that save what level the player
	# is on so it can go there again
	_resume()
	var scene: PackedScene = load("res://scenes/ui/menu/menu_screen.tscn")
	SceneTransition.change_scene(scene)
