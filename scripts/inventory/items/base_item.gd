extends Area2D
class_name Item

var item_name: String = "TEST"
var item_id: int = 0

func _on_body_entered(body):
	if body is Player:
		body.add_to_inventory(InventoryItem.new(item_name, item_id))
	
	queue_free()
