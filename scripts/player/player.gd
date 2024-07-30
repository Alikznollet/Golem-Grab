extends CharacterBody2D
class_name Player

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
	
