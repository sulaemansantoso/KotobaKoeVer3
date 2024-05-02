extends Node3D

@export
var material_res : Array[String]
var material_set : Array = []


func _ready() :
	for res in material_res :
		var result = load(res)
		material_set.push_back(result)

@onready
var scene_root = $DuckModel/Sketchfab_model/root/GLTF_SceneRootNode/_8
var value

func change_value (val) :
	value= val
	change_material (val)
	pass
	
	
func change_material(idx) :
	for child in scene_root.get_children() :
		if (child is MeshInstance3D) :
			pass
		else :
			for grandchildren in child.get_children() :
				if (grandchildren is MeshInstance3D):
					var new_material
					grandchildren.set_surface_override_material(0, material_set[idx])
	pass
