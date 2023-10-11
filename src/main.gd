extends Node2D

@onready var game_over_text : RichTextLabel = $GameOverText

func _ready() -> void:
	Autoload.game_over.connect(game_over_handle)
	Autoload.confetti_boom.connect(game_over_handle)
	$Bonbons.get_children().pick_random().explode()


func boom_handle() -> void:
	if $Bonbons.get_child_count() == 0 and Autoload.game_over != null:
		Autoload.conclude(true)
	

func game_over_handle(result: bool) -> void:
	if (Autoload.end):
		return
	game_over_text.visible = true
	if (!result):
		game_over_text.text = "LOSE"
