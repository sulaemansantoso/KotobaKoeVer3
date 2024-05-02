extends Control

signal ButtonPressed

func _on_button_pressed():
	emit_signal("ButtonPressed")
	pass # Replace with function body.
