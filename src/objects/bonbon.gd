extends Node2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

@onready var confetti_spawner = preload("res://objects/confetti.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame = randi() % 2
	var s = randf_range(0.8, 1.2)
	scale = Vector2(s, s)

func _on_area_2d_2_area_entered(area: Area2D) -> void:
	explode()

func explode():
	queue_free()
	var confetti = confetti_spawner.instantiate() as Node2D
	confetti.global_position = global_position
	get_parent().call_deferred("add_child", confetti)

func _on_area_2d_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			explode()
