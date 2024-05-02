extends Node3D

@export
var material_res : Array[String]
var material_set : Array = []
var disabled_material = preload("res://Assets/Room2/material/disabled.tres")


func _ready() :
	for res in material_res :
		var result = load(res)
		material_set.push_back(result)

@onready
var scene_root = $DuckModel/Sketchfab_model/root/GLTF_SceneRootNode/_8
var value


func animate() :
	$AnimationPlayer.play("Idle")


func deactivate() :
	change_material(-1)
	pass

func change_value (val) :
	value= val
	change_material (val)
	pass

	
func change_material(idx) :
	var material_to_set

	if (idx>0) :
		material_to_set = material_set[idx]
	else :
		material_to_set = disabled_material
			
	for child in scene_root.get_children() :
		if (child is MeshInstance3D) :
			pass
		else :
			for grandchildren in child.get_children() :
				if (grandchildren is MeshInstance3D):
					var new_material
					grandchildren.set_surface_override_material(0, material_to_set)
				else :
					for greatgrandchildren in grandchildren.get_children():
						if (greatgrandchildren is MeshInstance3D):
							greatgrandchildren.set_surface_override_material(0,material_to_set)
	pass
