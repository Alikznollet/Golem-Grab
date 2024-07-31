extends Node
class_name InventoryComponent

signal slot_changed()

var ITEMS: Array[InventoryItem] = []
var AMOUNTS: Dictionary = {}

func add_item(item: InventoryItem):
	if item.item_id in AMOUNTS:
		AMOUNTS[item.item_id] += 1
	else:
		ITEMS.append(item)
		AMOUNTS[item.item_id] = 1
		
	slot_changed.emit()
	
func remove_item(item_id: int):
	var item_index: int = _get_item_index(item_id)
	if item_index != -1:
		if AMOUNTS[item_id] == 1:
			AMOUNTS.erase(item_id)
			ITEMS.erase(item_index)
		else:
			AMOUNTS[item_id] -= 1
			ITEMS.erase(item_index)
		
		
func _get_item_index(item_id: int) -> int:
	for item in ITEMS:
		if item.item_id == item_id:
			return ITEMS.find(item)
			
	return -1
			
	
