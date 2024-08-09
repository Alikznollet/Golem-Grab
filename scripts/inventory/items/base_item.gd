extends Area2D
class_name Item

@export var item_color: Color = Color(255, 255, 255, 1)

@export var item_name: String = "TEST"
@export var item_id: int = 0
@onready var item_texture: Texture2D = preload("res://graphics/items/Stone_base.png")

func _ready():
	$Sprite2D.modulate = item_color
	$PointLight2D.color = item_color

func _on_body_entered(body):
	if body is Player:
		var tween: Tween = create_tween()
		tween.tween_property($Sprite2D, "scale", Vector2(0, 0), 0.3)
		tween.play()
		await tween.finished
		body.add_to_inventory(InventoryItem.new(item_name, item_id, item_texture, item_color))
		
	queue_free()
