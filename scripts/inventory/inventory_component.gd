extends Node
class_name InventoryComponent

var ITEMS: Array[InventoryItem] = []

func add_item(item: InventoryItem):
	ITEMS.append(item)
	
func get_items() -> Array[InventoryItem]:
	return ITEMS
