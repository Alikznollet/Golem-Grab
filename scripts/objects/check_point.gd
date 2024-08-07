extends Area2D

var has_triggered: bool = false

func _on_body_entered(body):
	if body is Player and !has_triggered:
		has_triggered = true
		Globals.respawn_position = global_position
		$AnimatedSprite2D.play()
