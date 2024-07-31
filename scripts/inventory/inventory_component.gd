extends Node
class_name InventoryComponent

signal slot_changed()

var ITEMS: Array[InventoryItem] = []

func add_item(item: InventoryItem):
	ITEMS.append(item)
		
	slot_changed.emit()
	
func remove_item(item_id: int):
	var item_index: int = _get_item_index(item_id) 
	if item_index != -1:
		ITEMS.remove_at(item_index)
		print(item_index)
		
func _get_item_index(item_id: int) -> int:
	for item in ITEMS:
		if item.item_id == item_id:
			return ITEMS.find(item)
			
	return -1
			
	
