extends Node2D
class_name Guy

@onready var face : AnimatedSprite2D = $AnimatedSprite2D
@onready var mouth : AudioStreamPlayer2D = $AudioStreamPlayer2D

var held : bool = false
var booming : bool = false

func _ready() -> void:
	Autoload.confetti_boom.connect(boom)
	Autoload.game_over.connect(game_over)

func boom() -> void:
	if booming:
		return
	booming = true
	face.frame = 1
	await get_tree().create_timer(0.5).timeout
	face.frame = 0
	booming = false

func game_over(result: bool) -> void:
	if result:
		face.frame = 3
		mouth.play()
	else:
		face.frame = 2
	

func _process(delta: float) -> void:
	if (held):
		global_position = get_global_mouse_position()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		held = event.is_pressed()
		if held:
			$RichTextLabel.visible = false
