extends TextureButton

@export var text: String = "null"
@export var target_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text
	
	if texture_normal:
		var image: Image = texture_normal.get_image()
		var bitmap: BitMap = BitMap.new()
		bitmap.create_from_image_alpha(image)
		texture_click_mask = bitmap

func _on_pressed():
	if target_scene:
		SceneTransition.change_scene(target_scene)
