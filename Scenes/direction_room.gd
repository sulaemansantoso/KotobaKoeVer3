extends Node3D

@export_range(0,2)
var level : int

var json_value
@export_file("*.json") var json_file
var to_guess :Array = []
var guess_right : int = 0

func update_info(idx) :
	$info_viweport.get_scene_instance().set_info(json_value[idx]["English"], json_value[idx]["Japanese"] + " " + json_value[idx]["Romaji"])
	#json_value[idx]
	pass

func _ready():
	#load info from json file into an array of object
	var json_string =  FileAccess.get_file_as_string(json_file)
	print(json_string)
	json_value = JSON.parse_string(json_string)
	#for board in $LearningBoard.get_children():
		#if (board.has_method("pasang_resource")):
			#board.pasang_resource(json_value)
			#board.connect("ValueSelected",learning_tile_click)
		#pass
	
		
	#var val :int = 0
	#for board in $TypingBoard.get_children() :
		#if (board.has_method("pasang_resource")):
			#board.pasang_resource(json_value)
			#board.change_idx( val)
			#val = (val +1)%12
			#board.connect("ValueSelected", typing_tile_click)
	#randomize_duck()
	#
	pass

