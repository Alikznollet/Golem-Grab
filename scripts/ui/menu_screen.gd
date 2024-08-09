extends CanvasLayer

func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 20 * delta

func _on_play_pressed():
	var scene: PackedScene = load("res://scenes/levels/tutorial.tscn")
	SceneTransition.change_scene(scene)

func _on_options_pressed():
	var scene: PackedScene = load("res://scenes/ui/menu/settings_menu.tscn")
	SceneTransition.change_scene(scene)

func _on_quit_pressed():
	get_tree().quit()
