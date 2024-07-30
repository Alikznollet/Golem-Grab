extends Node
class_name FSM

var states: Dictionary = {}
var current_state: State
@export var initial_state: State

func _ready():
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.Transition.connect(switch_state)
			
	initial_state.Enter(initial_state)
	current_state = initial_state
	
func switch_state(old_state: State, new_state: String) -> void:
	if old_state != current_state:
		return
		
	var state: State = states[new_state.to_lower()]
	if state:
		state.Enter(old_state)
		old_state.Exit()
		current_state = state
		
func _process(delta):
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)
	

