extends State
class_name Falling

func Physics_Update(delta: float):
	player.velocity.y += player.fall_gravity * delta
	
	var direction: int
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	player.velocity.x = player.move_speed * direction
	
	if player.is_on_floor():
		Transition.emit(self, "idle")
