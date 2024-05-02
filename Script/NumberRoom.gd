extends Node3D

signal bilang_pindah_level

@export
var isAdvance :bool 

@onready
var roman = get_node("Roman");
var list_numbers : Array

func _ready():
	reset_number()
	for board in $LearningBoard.get_children():
		if (board.has_signal("ValueSelected")):
			board.connect("ValueSelected", play_sound)
	for board in $TypingBoard.get_children():
		if (board.has_method("change_number")):
			board.connect("ValueSelected",guess_individual)

func guess_individual(idx) :
	#play_sound(idx)
	guess_number(idx)
	print("guessing_number : " + str(idx))
	

func play_sound(idx) :
	var audio_to_play = get_node("Audios/"+str(idx+1))
	audio_to_play.play()
	roman.change_frame(idx)

func _process(delta):
	pass
	#$LabelViewport.get_scene_instance().create_number()
	#list_numbers = $LabelViewport.get_scene_instance().soal
		#
	#if (Input.is_action_just_pressed ("ui_accept")): 
		#for board in $Boards.get_children():
			#board.change_number()
					
func guess_number(idx) :
	play_sound(idx)
	if (!list_numbers.is_empty()):
		if (list_numbers[0] == idx+1) :
			$SoalAnimPlayer.play("Benar")
			list_numbers.pop_front()
			$LabelViewport.get_scene_instance().soal = list_numbers
			$ConfirmSound.play()#
			if (list_numbers.is_empty()):#
				print("win one")
		else :
			$ErrorSound.play()
			$SoalAnimPlayer.play("Salah")
			

func reset_number() :
	$LabelViewport.get_scene_instance().create_number()
	list_numbers = $LabelViewport.get_scene_instance().soal
	pass
	
func reset_board() :
	var board_number : Array = [0,1,2,3,4,5,6,7,8]
	board_number.shuffle()
	
	for board in $TypingBoard.get_children():
		if (board.has_method("change_number_value")):
			var value : int = board_number.pop_front()
			board.change_number_value(value)
	pass

func _on_button_guess_button_pressed():
	reset_number()
	#kalau mau di hidden dulu komen disini
	if (isAdvance) :
		reset_board()	

func _on_portal_color_pindah_level(kemana):
	emit_signal("bilang_pindah_level",kemana)
	pass # Replace with function body.
