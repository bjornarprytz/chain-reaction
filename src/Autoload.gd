extends Node

var end : bool = false;

signal confetti_boom
signal game_over(result: bool)

func boom():
	confetti_boom.emit()
	
func conclude(result: bool):
	game_over.emit(result)

func _ready() -> void:
	game_over.connect(t)
	
func t():
	end = true
