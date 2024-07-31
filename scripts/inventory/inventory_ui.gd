extends Control

@export var inventory: InventoryComponent
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func update_slots():
	for i in range(slots.size()):
		if i < inventory.ITEMS.size():
			var item: InventoryItem = inventory.ITEMS[i]
			slots[i].update(item)
		else:
			slots[i].update(null)

func close():
	visible = false
	is_open = false
	
func open():
	visible = true
	is_open = true
	
func _ready():
	close()
	update_slots()
	
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()

func _on_inventory_component_slot_changed():
	update_slots()
