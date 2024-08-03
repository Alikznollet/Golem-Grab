extends State
class_name Jumping

func Enter(_state: State):
	player.velocity.y = player.jump_velocity
	player.sprite.animation = "jump"
	player.sprite.play()

func Physics_Update(delta: float) -> void:
	player.velocity.y += player.jump_gravity * delta
	player.handle_input_velocity()
	
	if player.velocity.y >= 0:
		Transition.emit(self, "falling")
