extends Node3D

@onready var room = $number_room

func _ready():
	room.connect("bilang_pindah_level",_on_number_room_bilang_pindah_level )
	$level_setting.get_scene_instance().connect("scene_1_level_changed", scene_1_level_change)
	$level_setting.get_scene_instance().connect("scene_2_level_changed", scene_2_level_change)
	$level_setting.get_scene_instance().connect("scene_3_level_changed", scene_3_level_change)
	
	$"Color Room".level = 0
	$direction_room.level = 0
	
	pass

func scene_1_level_change(level) :
	#$number_room.level = level
	pass
func scene_2_level_change(level) :
	$"Color Room".level = level
	pass
func scene_3_level_change(level) :
	$direction_room.level = level
	pass



func _on_number_room_bilang_pindah_level(kemana):
	var last_room = room
	var scene_loaded = load("res://Scenes/" + kemana + "_room.tscn")
	room = scene_loaded.instantiate()
	add_child(room)
	
	await get_tree().create_timer(1.0).timeout 
	last_room.queue_free()
	pass # queue_free()ith function body.
