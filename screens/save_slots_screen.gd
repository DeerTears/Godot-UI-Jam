## Handles saving and loading files from the player's game.s
extends Control

const FIRST := 0

func _ready() -> void:
	for slot in $Slots.get_children():
		for button in slot.get_children():
			button.pressed.connect(
				Callable(self, "on_button_pressed").bind(
					button.slot, button.function
				)
			)
	$PopupDelete.ok_pressed.connect(on_confirm_delete)

func save_file(slot: int) -> void:
	FileAccess.open(
		"user://game_%s.save" % [slot], FileAccess.WRITE
	).store_string(
		"hi! %s" % [Time.get_unix_time_from_system()]
	)

func on_button_pressed(slot: int, function: SaveLoadDeleteButton.FUNCTIONS) -> void:
	match function:
		SaveLoadDeleteButton.FUNCTIONS.SAVE:
			save_file(slot)
		SaveLoadDeleteButton.FUNCTIONS.LOAD:
			load_file(slot)
		SaveLoadDeleteButton.FUNCTIONS.DELETE:
			confirm_delete(slot)

func confirm_delete(slot: int) -> void:
	$PopupDelete.reason = $PopupDelete.REASONS.DELETE_CONFIRM
	$PopupDelete.slot = slot
	$PopupDelete.popup()

func on_confirm_delete(slot: int) -> void:
	delete_file(slot)

func delete_file(slot: int) -> void:
	var path: String = "user://game_%s.save" % [slot]
	if FileAccess.file_exists(path):
		OS.move_to_trash(ProjectSettings.globalize_path(path))
	else:
		push_warning("file %s did not exist, no action taken" % [slot])

func load_file(slot: int) -> void:
	pass
	
