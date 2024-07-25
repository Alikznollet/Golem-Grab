extends CharacterBody2D
class_name Player

func _process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -50
	elif Input.is_action_pressed("right"):
		velocity.x = 50
	else:
		velocity.x = 0
		
	move_and_slide()
