extends Node
class_name InventoryItem

var item_name: String
var item_id: int
var item_texture: Texture2D
var item_color: Color

func _init(i_name: String, id: int, texture: Texture2D, color: Color):
	item_name = i_name
	item_id = id
	item_texture = texture
	item_color = color
	
