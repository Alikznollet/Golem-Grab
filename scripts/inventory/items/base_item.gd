extends Area2D
class_name Item

@export var item_name: String = "TEST"
@export var item_id: int = 0
@export var item_texture: Texture2D

func _ready():
	$Sprite2D.texture = item_texture

func _on_body_entered(body):
	if body is Player:
		body.add_to_inventory(InventoryItem.new(item_name, item_id, item_texture))
	
	queue_free()
