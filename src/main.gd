extends Node2D

var game_over : bool = false

@onready var game_over_text : RichTextLabel = $GameOverText

func _ready() -> void:
	Autoload.game_over.connect(game_over_handle)

func _process(delta: float) -> void:
	if $Bonbons.get_child_count() == 0 and !game_over:
		Autoload.game_over.emit(true)
		game_over = true

func game_over_handle(result: bool) -> void:
	game_over_text.visible = true
	if (!result):
		game_over_text.text = "LOSE"
