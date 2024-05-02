extends Node3D

@export
var isDemo : bool 
@export_range(0,11)
var value : int

signal ValueSelected
var image_sprite

func change_number() :
	if (image_sprite) :
		image_sprite.frame = randi() %9

func _ready() :
	image_sprite = $StaticBody3D/Mesh/Image
	if (!isDemo) :
		image_sprite.frame = randi() %9
		value  = image_sprite.frame
	else :
		image_sprite.frame = value
		
func _on_static_body_3d_pointer_event(event):
	if (!isDemo) and (event.event_type == 2):
		change_number()
	if (event.event_type ==2) :
		emit_signal("ValueSelected", value)
		$AnimationPlayer.play("clicked")
	pass # Replace with function body.


