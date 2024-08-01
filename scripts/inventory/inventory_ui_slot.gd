extends TextureRect

func update(item: InventoryItem):
	# TODO: make the item pop up instead of just appear with animation
	if item:
		$CenterContainer/TextureRect.texture = item.item_texture
		$CenterContainer/TextureRect.modulate = item.item_color
	
