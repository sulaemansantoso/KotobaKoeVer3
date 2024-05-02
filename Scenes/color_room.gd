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
	guess_right = 0
	var available = [0,1,2,3,4,5,6,7,8,9,10]
	available.shuffle()
	for duck in $model_position.get_children():
		var r_value = available.pop_front()
		to_guess.push_back(r_value)
		duck.change_value(r_value)
	reset_typing_board(level)
	pass

func guess_duck(idx) :
	if (guess_right < to_guess.size()):
		if (to_guess[guess_right] == idx) :
			#guess bener .. animate lalu disable duck
			for i in range(0,to_guess.size()):
				if (i == guess_right):
					if ( $model_position.get_child(i).has_method("animate")) :
						$model_position.get_child(i).animate()
						$model_position.get_child(i).deactivate()
			guess_right = guess_right + 1 	
			pass	
			$ConfirmSound.play()
		else :
			$ErrorSound.play()
	else :
		pass
	pass

func typing_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	guess_duck(idx)
	pass
	
func learning_tile_click(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	update_info(idx)
	#roman.change_frame(idx)
	pass


func reset_learning_board() :
	
	pass

func reset_typing_board(level) :
	var available_value = [0,1,2,3,4,5,6,7,8,9,10]
	if (level >0) :
		available_value.shuffle()
	var val :int = 0
	for board in $TypingBoard.get_children() :
		if (board.has_method("change_idx")):
			val = available_value.pop_front()
			board.change_idx( val)
		if (level >1) :
			if (board.has_method("hide_button_color")):
				board.hide_button_color(true)
		else :
			board.hide_button_color(false)
	pass


func _on_button_guess_button_pressed():
	randomize_duck()
	pass # Replace with function body.
