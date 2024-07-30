extends Node
class_name InventoryItem

var item_name: String
var item_id: int
var item_texture: Texture2D

func _init(i_name: String, id: int, texture: Texture2D):
	item_name = i_name
	item_id = id
	item_texture = texture
	
