extends Area2D
class_name Interactible

signal interaction()

var player_in_distance: bool
@export var button_visual: Node

func _ready():
	button_visual.visible = false

func _on_body_entered(body):
	if body is Player:
		player_in_distance = true
		button_visual.visible = true
		
func _on_body_exited(body):
	if body is Player:
		player_in_distance = false
		button_visual.visible = false
		
func _process(_delta):
	if player_in_distance and Input.is_action_just_pressed("interact"):
		interaction.emit()
