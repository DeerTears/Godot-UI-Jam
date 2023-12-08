class_name SaveLoadDeleteButton
extends Button

enum FUNCTIONS {
	SAVE,
	LOAD,
	DELETE
}

@export_range(1, 3) var slot: int = 1
@export var function: FUNCTIONS = FUNCTIONS.SAVE
