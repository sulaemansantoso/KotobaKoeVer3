extends Control


var score : int = 0
@onready
var button = $Panel/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	button.text = str(score)
	pass # Replace with function body.

func add_score(value) :
	score += value
	button.text = str(score)
	
func reset_score() :
	score =0
	button.text = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	reset_score()
	pass # Replace with function body.
