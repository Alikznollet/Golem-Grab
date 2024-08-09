extends Node
class_name Config

var fullscreen: bool
var dimension_x: int
var dimension_y: int

func _init(fullscreen: bool, dimension_x: int, dimension_y: int):
	self.fullscreen = fullscreen
	self.dimension_x = dimension_x
	self.dimension_y = dimension_y
