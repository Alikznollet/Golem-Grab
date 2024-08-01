extends Area2D
class_name Item

@export var item_color: Color = Color(255, 255, 255, 1)

@export var item_name: String = "TEST"
@export var item_id: int = 0
@onready var item_texture: Texture2D = preload("res://graphics/items/Stone_base.png")

func _ready():
	$Sprite2D.modulate = item_color

func _on_body_entered(body):
	if body is Player:
		# TODO: add an animation when picking up an item
		body.add_to_inventory(InventoryItem.new(item_name, item_id, item_texture, item_color))
	
	queue_free()
