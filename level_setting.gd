extends Control

var scene_1_level : float = 0
var scene_2_level : float = 0
var scene_3_level : float =0

signal  scene_1_level_changed
signal  scene_2_level_changed
signal  scene_3_level_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_plus_scene_1_pressed() -> void:
	if (scene_1_level < 2) :
		scene_1_level = scene_1_level +1
		emit_signal("scene_1_level_changed", scene_1_level)
		$HBoxContainer/Column1/label_level_scene_1.text = str(scene_1_level)
	pass # Replace with function body.


func _on_btn_min_scene_1_pressed() -> void:
	if (scene_1_level > 0) :
		scene_1_level = scene_1_level -1
		emit_signal("scene_1_level_changed", scene_1_level)
		$HBoxContainer/Column1/label_level_scene_1.text = str(scene_1_level)
	pass # Replace with function body.


func _on_btn_plus_scene_2_pressed() -> void:
	if (scene_2_level < 2) :
		scene_2_level = scene_2_level +1
		emit_signal("scene_2_level_changed", scene_2_level)
		$HBoxContainer/Column2/label_level_scene_2.text = str(scene_2_level)

	pass # Replace with function body.


func _on_btn_min_scene_2_pressed() -> void:
	if (scene_2_level > 0) :
		scene_2_level = scene_2_level -1
		emit_signal("scene_2_level_changed", scene_2_level)
		$HBoxContainer/Column2/label_level_scene_2.text = str(scene_2_level)
	pass # Replace with function body.

func _on_btn_plus_scene_3_pressed() -> void:
	if (scene_3_level < 2) :
		scene_3_level = scene_3_level +1
		emit_signal("scene_3_level_changed", scene_3_level)
		$HBoxContainer/Column3/label_level_scene_3.text = str(scene_3_level)

	pass # Replace with function body.


func _on_btn_min_scene_3_pressed() -> void:
	if (scene_3_level > 0) :
		scene_3_level = scene_3_level -1
		emit_signal("scene_3_level_changed", scene_3_level)
		$HBoxContainer/Column3/label_level_scene_3.text = str(scene_3_level)
	pass # Replace with function body.
