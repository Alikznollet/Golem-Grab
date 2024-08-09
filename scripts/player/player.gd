extends CharacterBody2D
class_name Player

@export var inventory: InventoryComponent
@export var sprite: AnimatedSprite2D
@export var collisionshape: CollisionShape2D

@export var move_speed: float

@export var coyote_time: float
@export var jump_buffer: float
@export var hover_time: float

@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1

func _ready():
	Globals.respawn_position = global_position

func _process(_delta):
	move_and_slide()
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
		
## This function returns the direction the player is going and handles
## any input that affects the velocity of the player
func handle_input_velocity() -> int:
	var direction: int
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
		
	# normal walk speed on the ground
	if is_on_floor():
		velocity.x = direction * move_speed
	else:
		if direction == 1 and velocity.x <= 0:
			velocity.x += 5
		elif direction == 1 and velocity.x >= 0:
			if abs(velocity.x) < move_speed:
				velocity.x += 5
		elif direction == -1 and velocity.x >= 0:
			velocity.x -= 5
		elif direction == -1 and velocity.x <= 0:
			if abs(velocity.x) < move_speed:
				velocity.x -= 5
		
	return direction
	
func add_to_inventory(item: InventoryItem):
	inventory.add_item(item)

var player_respawning: bool = false

func _on_detection_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	# TODO: respawn animation and mechanics refinement
	if !player_respawning:
		$FSM.force_set_state("respawning")
	player_respawning = true
