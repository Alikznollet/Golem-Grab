extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = name
	if texture_normal:
		var image: Image = texture_normal.get_image()
		var bitmap: BitMap = BitMap.new()
		bitmap.create_from_image_alpha(image)
		texture_click_mask = bitmap
