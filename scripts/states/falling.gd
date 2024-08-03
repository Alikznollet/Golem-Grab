extends State
class_name Falling

var current_coyote_time: float
var current_jump_buffer_time: float
var current_hover_time: float

func Enter(state: State):
	previous_state = state
	current_coyote_time = player.coyote_time
	current_hover_time = player.hover_time
	
func Update(delta: float):
	current_coyote_time -= delta
	current_jump_buffer_time -= delta
	current_hover_time -= delta

func Physics_Update(delta: float):
	player.handle_input_velocity()
	# NOTE: this will make the player hover for a certain amount of time
	if current_hover_time < 0:
		player.velocity.y += player.fall_gravity * delta
	
	if Input.is_action_pressed("jump") and current_coyote_time > 0 and not previous_state is Jumping:
		Transition.emit(self, "jumping")
		
	if Input.is_action_pressed("jump") and current_coyote_time < 0:
		current_jump_buffer_time = player.jump_buffer
	
	if player.is_on_floor():
		if current_jump_buffer_time > 0:
			Transition.emit(self, "jumping")
		else:
			Transition.emit(self, "idle")
