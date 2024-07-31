extends Panel

@onready var item_display: Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var amount_label: Label = $Label

func update(item: InventoryItem, amount: int):
	if !item:
		item_display.visible = false
	else:
		item_display.visible = true
		item_display.texture = item.item_texture
		amount_label.text = str(amount)
	
