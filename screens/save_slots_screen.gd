## Handles saving and loading files from the player's game.s
extends Control

func _ready() -> void:
	for child in $H.get_children():
		for button in child.get_child(0).get_children():
			button.pressed.connect(Callable(self, "on_button_pressed"))

