extends Node3D

var json_value
@export_file("*.json") var json_file
var to_guess :Array = []

func update_info(idx) :
	$info_viweport.get_scene_instance().set_info(json_value[idx]["English"], json_value[idx]["Japanese"] + " " + json_value[idx]["Romaji"])
	#json_value[idx]
	pass

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
	
		
	var val :int = 0
	for board in $TypingBoard.get_children() :
		if (board.has_method("pasang_resource")):
			board.pasang_resource(json_value)
			board.change_idx( val)
			val = (val +1)%12
			board.connect("ValueSelected", typing_tile_click)
	randomize_duck()
	
	pass
	
func randomize_duck():
	to_guess = []
	var available = [0,1,2,3,4,5,6,7,8,9,10]
	available.shuffle()
	for duck in $model_position.get_children():
		var r_value = available.pop_front()
		to_guess.push_back(r_value)
		duck.change_value(r_value)
	pass
	
func typing_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	
	pass
	
func learning_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	update_info(idx)
	#roman.change_frame(idx)
	pass


func randomize_typing_board() :
	var available_value = [0,1,2,3,4,5,6,7,8]
	var val : int = 0
	available_value.shuffle()
	
	for board in $TypingBoard.get_children() :
		if (board.has_method("change_idx")):
			board.change_idx(available_value.pop_front())
			pass
	pass


func reset_learning_board() :

	pass

func reset_typing_board() :
	pass


func _on_button_guess_button_pressed():
	randomize_duck()
	pass # Replace with function body.
