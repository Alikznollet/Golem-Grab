extends State
class_name Walking

func Enter(_state: State):
	player.sprite.animation = "walk"
	player.sprite.play()

func Physics_Update(_delta: float):
	var direction = player.handle_input_velocity()
	
	if not player.is_on_floor():
		Transition.emit(self, "falling")
	else:
		if Input.is_action_pressed("jump"):
			Transition.emit(self, "jumping")
		
	if direction == 0:
		Transition.emit(self, "idle")
