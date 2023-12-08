class_name PopupConfirm
extends Popup


enum REASONS {
	DELETE_CONFIRM
}

@export var reason: REASONS
@export var slot: int

signal ok_pressed(slot_affected)

func _ready():
	hide()
	about_to_popup.connect(update_text.bind(reason))
	$MarginContainer/Panel/OK.pressed.connect(
		func():
			ok_pressed.emit(slot)
			hide()
	)
	$MarginContainer/Panel/Cancel.pressed.connect(
		func():
			hide()
	)

func update_text(_reason: REASONS) -> void:
	match _reason:
		REASONS.DELETE_CONFIRM:
			$MarginContainer/Panel/Text.text = "File in slot %s will be deleted. Proceed?" % [slot]
