## Updates the visual state of buttons, not the data.
extends Node

enum SCREEN_TYPES
{
	MAIN_MENU,
	SAVE_LOAD,
	SETTINGS,
}

enum BUTTON_TYPES
{
	SAVE_SLOT,
	LOAD_SLOT,
	DELETE_SLOT,
}

func modify_state(button_type: BUTTON_TYPES, data: Dictionary) -> void:
	match button_type:
		BUTTON_TYPES.SAVE_SLOT:
			pass
		BUTTON_TYPES.LOAD_SLOT:
			pass
		BUTTON_TYPES.DELETE_SLOT:
			pass
