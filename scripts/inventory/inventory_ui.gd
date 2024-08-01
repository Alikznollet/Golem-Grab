extends CanvasLayer

@export var inventory: InventoryComponent
@onready var UI_SLOT: PackedScene = preload("res://scenes/ui/inventory/inventory_ui_slot.tscn")

func update_slots():
	var slots = $HBoxContainer.get_children()
	for i in range(inventory.ITEMS.size()):
		var item: InventoryItem = inventory.ITEMS[i]
		slots[i].update(item)
		
	
func _ready():
	var slot: TextureRect
	for i in range(Globals.current_objective_amount):
		slot = UI_SLOT.instantiate()
		$HBoxContainer.add_child(slot)
	
func _on_inventory_component_slot_changed():
	update_slots()
