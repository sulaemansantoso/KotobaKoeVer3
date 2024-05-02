extends Node3D

@onready var room = $number_room

func _ready():
	room.connect("bilang_pindah_level",_on_number_room_bilang_pindah_level )
	pass

func _on_number_room_bilang_pindah_level(kemana):
	var last_room = room
	var scene_loaded = load("res://Scenes/" + kemana + "_room.tscn")
	room = scene_loaded.instantiate()
	add_child(room)
	
	await get_tree().create_timer(1.0).timeout 
	last_room.queue_free()
	pass # queue_free()ith function body.
