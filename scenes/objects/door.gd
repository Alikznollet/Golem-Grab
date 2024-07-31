extends Node2D

@export var required_item_ids: Array[int]
@export var next_level: PackedScene

@onready var button: Button = $Button
var player_in_distance: bool = false
var player: Player

func _ready():
	button.visible = false

func _on_body_entered(body):
	if body is Player:
		player_in_distance = true
		button.visible = true
		player = body


func _on_body_exited(body):
	if body is Player:
		player_in_distance = false
		button.visible = false

func _process(delta):
	if player_in_distance and Input.is_action_just_pressed("interact"):
		_check_inventory()
	

func _check_inventory():
	var correct_items: Array[InventoryItem] = []
	for item in player.inventory.ITEMS:
		if item.item_id in required_item_ids:
			print(item.item_id, required_item_ids)
			correct_items.append(item)
		
	print(correct_items)
			
	if correct_items.size() == required_item_ids.size():
		for item in correct_items:
			player.inventory.remove_item(item.item_id)
			
		player.inventory.emit_signal("slot_changed")
		print(player.inventory.ITEMS)
			
	next_level.instantiate()
	get_tree().change_scene_to_packed(next_level)
		
