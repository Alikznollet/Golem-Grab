extends State
class_name Jumping

func Enter():
	player.velocity.y = player.jump_velocity
	print(player.velocity.y)

func Physics_Update(delta: float) -> void:
	player.velocity.y += player.jump_gravity * delta
	
	var direction: int
	if Input.is_action_pressed("left"):
		direction = -1
	elif Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	player.velocity.x = player.move_speed * direction
	
	if player.velocity.y < 0:
		Transition.emit(self, "falling")
