extends Node2D


var held : bool = false

func _process(delta: float) -> void:
	if (held):
		global_position = get_global_mouse_position()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		held = event.is_pressed()
		
