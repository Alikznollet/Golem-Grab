extends Node
class_name State

signal Transition(state: State, new_state_name: String)
@onready var player: Player = get_tree().get_first_node_in_group("Player")

func Enter() -> void:
	pass
	
func Exit() -> void:
	pass
	
func Update(delta: float) -> void:
	pass
	
func Physics_Update(delta: float) -> void:
	pass
