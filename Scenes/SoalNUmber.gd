extends Control

var soal :Array :
	get : 
		return soal
	set(value) : 
		soal = value
		$LabelEdit.text = ""
		for j in range(soal.size()) :
			$LabelEdit.text += str(soal[j]) + " " 

		
@export_range(3,7)
var no_soal : int

func remove_number() :
	soal.pop_back()
	$LabelEdit.text = ""
	for j in range(soal.size()) :
		$LabelEdit.text += str(soal[j]) + " " 

func create_number():
	soal = Array()
	for i in range(no_soal) :
		var temp = randi_range(1,9)
		soal.append(temp)
	
	$LabelEdit.text = ""
	for j in range(soal.size()) :
		$LabelEdit.text += str(soal[j]) + " " 

func _ready() :
	create_number()
	#for i in range(soal.count) :
		#$LabelEdit.text += str(soal[i]) + " "
