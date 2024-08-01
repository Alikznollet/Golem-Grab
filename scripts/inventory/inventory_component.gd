extends Node
class_name InventoryComponent

signal slot_changed()

var ITEMS: Array[InventoryItem] = []

func add_item(item: InventoryItem):
	ITEMS.append(item)
	slot_changed.emit()
