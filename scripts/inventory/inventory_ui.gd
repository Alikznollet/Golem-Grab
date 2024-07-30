extends Control

@export var inventory: InventoryComponent
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func update_slots():
	for i in range(min(inventory.ITEMS.size(), slots.size())):
		slots[i].update(inventory.ITEMS[i])

func close():
	visible = false
	is_open = false
	
func open():
	visible = true
	is_open = true
	
func _ready():
	close()
	
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()

func _on_inventory_component_item_added(item):
	update_slots()
