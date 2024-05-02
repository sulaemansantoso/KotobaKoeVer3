extends Node3D

signal button_pressed
@onready var text : Label3D = get_node("Label3D")
@onready var sprite : Sprite3D = get_node("Sprite3D")

@export var text_value : String;

func get_text() :
	return text_value
	
func set_text(text2) :
	text_value = text2
	text.text = text2
	
func set_color(color) :
	sprite.modulate = color
	

func _ready():
	text.text = text_value

func _on_static_body_3d_pointer_event(event):
	
	if (event.event_type == 2) :
		emit_signal("button_pressed")
	pass # Replace with function body.
