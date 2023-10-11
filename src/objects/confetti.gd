extends Node2D

@onready var particles : CPUParticles2D = $CPUParticles2D
@onready var sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var explosion : Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particles.emitting = true
	sound.pitch_scale = randf_range(0.9, 1.1)
	Autoload.boom()
	
	var tween = create_tween()
	
	await tween.tween_property(explosion, 'scale', Vector2(4,4), particles.lifetime).finished
	
	queue_free()




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.owner is Guy:
		Autoload.conclude(false)
