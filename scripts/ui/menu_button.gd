extends TextureButton

@export var text: String = "null"
@export var target_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text

func _on_pressed():
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
