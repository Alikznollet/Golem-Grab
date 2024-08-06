extends Node2D

@export var required_objective_amount: int
@export var next_level: PackedScene

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var opened: bool = false
@onready var player: Player = get_tree().get_first_node_in_group("Player")

func _ready():
	Globals.current_objective_amount = required_objective_amount
	
func _open():
	opened = true
	sprite.play()
	
func _interaction():
	if opened:
		SceneTransition.change_scene(next_level)
	elif player.inventory.ITEMS.size() == required_objective_amount:
		_open()
