extends State
class_name Respawning

func Enter(_state: State):
	player.velocity = Vector2.ZERO
	
	player.sprite.animation = "death"
	player.sprite.play()
	player.collisionshape.set_deferred("disabled", true)
	await player.sprite.animation_finished
	
	var tween: Tween = create_tween()
	tween.tween_property(player, "global_position", Globals.respawn_position, 0.5)
	await tween.finished
	
	player.sprite.animation = "respawn"
	player.sprite.play()
	player.collisionshape.set_deferred("disabled", false)
	await player.sprite.animation_finished
	
	player.player_respawning = false
	
	Transition.emit(self, "idle")
