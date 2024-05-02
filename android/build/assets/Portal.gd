extends XRToolsInteractableBody

signal pindah_level

@export 
var kemana : String

func _ready():
	if (kemana != "") :
		$Label3D.text = kemana

func _on_pointer_event(event):
	if (event.event_type ==1) :
		$AnimationPlayer.play("Exit")
	if (event.event_type ==0) :
		$AnimationPlayer.play("Enter")
	if (event.event_type == 2) :
		emit_signal ("pindah_level", kemana)
	pass # Replace with function body.
