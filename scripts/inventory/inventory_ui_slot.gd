extends TextureRect

@onready var stone: TextureRect = $CenterContainer/TextureRect

func update(item: InventoryItem):
	if item:
		stone.modulate = item.item_color
		
		if !stone.texture:
			stone.texture = item.item_texture
			var tween: Tween = create_tween()
			tween.tween_property($CenterContainer, "scale", Vector2(1, 1),  0.2).from(Vector2(3, 3))
			tween.play()
	
