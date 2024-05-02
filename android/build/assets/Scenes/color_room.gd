extends Node3D

var json_value
@export_file("*.json") var json_file

func _ready():
	#load info from json file into an array of object
	var json_string =  FileAccess.get_file_as_string(json_file)
	print(json_string)
	json_value = JSON.parse_string(json_string)
	for board in $LearningBoard.get_children():
		if (board.has_method("pasang_resource")):
			board.pasang_resource(json_value)
			board.connect("ValueSelected",learning_tile_click)
		pass
	for board in $TypingBoard.get_children() :
		if (board.has_method("pasang_resource")):
			board.pasang_resource(json_value)
			board.connect("ValueSelected", typing_tile_click)
	
func typing_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	pass
	
func learning_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	#roman.change_frame(idx)
	pass


func reset_learning_board() :

	pass

func reset_typing_board() :
	pass