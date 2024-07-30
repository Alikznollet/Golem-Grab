extends Node
class_name InventoryComponent

signal item_added(item: InventoryItem)

var ITEMS: Array[InventoryItem] = []

func add_item(item: InventoryItem):
	ITEMS.append(item)
	item_added.emit(item)
	
func get_items() -> Array[InventoryItem]:
	return ITEMS
