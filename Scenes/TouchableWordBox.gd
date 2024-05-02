extends Node3D

@export
var isDemo : bool

var word_list : Array
@export
var value : Array

var hide_color: bool = false

@export 
var idx :int

var selected_value : String

signal ValueSelected

func _ready():
	#var idx = randi()%9
	pass

func change_idx(id) :
	idx = id
	selected_value = value[idx]["Japanese"]
	$StaticBody3D/Mesh/Label3D.text = selected_value
	var mesh_panel : Sprite3D= $"StaticBody3D/Mesh/Flashing Layer"
	#mesh_panel.get_active_material(0).albedo_color = Color(value[idx]["English"])
	$StaticBody3D/Mesh/BackgroundSprite.modulate = Color(value[idx]["English"])
	pass

func hide_button_color(shouldHide):
	$StaticBody3D/Mesh/BackgroundSprite.visible = !shouldHide
	pass

func pasang_resource(res):
	value=  res
	selected_value = value[idx]["Japanese"]
	$StaticBody3D/Mesh/Label3D.text = selected_value
	var mesh_panel : MeshInstance3D = $StaticBody3D/Mesh 
	#mesh_panel.get_active_material(0).albedo_color = Color(value[idx]["English"])
	#print(Color(value[idx]["English"]))
	#mesh_panel.get_active_material(0).albedo_color = Color(value[idx]["English"])
	$StaticBody3D/Mesh/BackgroundSprite.modulate = Color(value[idx]["English"])


func _on_static_body_3d_pointer_event(event):
	if (!isDemo) and (event.event_type == 2):
		#do something on demo
		pass
	if (event.event_type ==2) :
		emit_signal("ValueSelected", idx)
		$AnimationPlayer.play("clicked")
	pass # Replace with function body.

