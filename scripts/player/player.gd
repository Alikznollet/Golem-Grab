extends CharacterBody2D
class_name Player

@export var inventory: InventoryComponent

@export var move_speed: float

@export var coyote_time: float
@export var jump_buffer: float

@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1

func _process(_delta):
	move_and_slide()
	
func add_to_inventory(item: InventoryItem):
	inventory.add_item(item)

func _on_detection_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	# TO DO: respawn system
	queue_free()
