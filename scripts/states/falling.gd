extends State
class_name Falling

var current_coyote_time: float
var current_jump_buffer_time: float

func Enter(state: State):
	previous_state = state
	current_coyote_time = player.coyote_time
	
func Update(delta: float):
	current_coyote_time -= delta
	current_jump_buffer_time -= delta

func Physics_Update(delta: float):
	player.velocity.y += player.fall_gravity * delta
	
	if Input.is_action_pressed("jump") and current_coyote_time > 0 and not previous_state is Jumping:
		Transition.emit(self, "jumping")
		
	if Input.is_action_pressed("jump") and current_coyote_time < 0:
		current_jump_buffer_time = player.jump_buffer
	
	var direction: int
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	player.velocity.x = player.move_speed * direction
	
	if player.is_on_floor():
		if current_jump_buffer_time > 0:
			Transition.emit(self, "jumping")
		else:
			Transition.emit(self, "idle")
