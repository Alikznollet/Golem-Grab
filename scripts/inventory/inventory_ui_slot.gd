extends TextureRect

func update(item: InventoryItem):
	if item:
		$CenterContainer/TextureRect.texture = item.item_texture
		$CenterContainer/TextureRect.modulate = item.item_color
	
