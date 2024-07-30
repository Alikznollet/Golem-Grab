extends State
class_name Idle

func Update(_delta: float) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		Transition.emit(self, "walking")
		
	if not player.is_on_floor():
		Transition.emit(self, "falling")
	else:
		if Input.is_action_pressed("jump"):
			Transition.emit(self, "jumping")
