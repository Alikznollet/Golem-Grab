extends CanvasLayer

func _process(delta):
	$ParallaxBackground.scroll_offset.x -= 20*delta
