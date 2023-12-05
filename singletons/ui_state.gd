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
			save_data(data)
		BUTTON_TYPES.LOAD_SLOT:
			load_data(data)
		BUTTON_TYPES.DELETE_SLOT:
			delete_data(data)

func save_data(data: Dictionary) -> void:
	pass

func load_data(data: Dictionary) -> void:
	pass

func delete_data(data: Dictionary) -> void:
	pass
