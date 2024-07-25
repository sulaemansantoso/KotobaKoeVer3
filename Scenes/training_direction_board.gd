extends Node3D

@export
var target : PackedScene
var target_instance : Area3D

enum Movement {
	up,
	down,
	left,
	right
};

var speed : int = 32

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func spawn_instance() :
	var coord : Vector2
	
	coord = Vector2(randi_range(-16,17), randi_range(-18,16))
	target_instance  = target.instantiate()
	target_instance.position = Vector3(coord.x,-2.8, coord.y)
	$GridMap.add_child(target_instance)
	target_instance.connect("target_collected", target_collected_handle)
	
	# dari -16 16 
	# ke 17 -18
	pass
	
func target_collected_handle() :
	$GridMap.remove_child(target_instance)
	target_instance.queue_free()
	$Timer.start()
	pass

func move_character(idx)->void :
	var movement = Vector3(0,0,0)
	if (idx == 0) :
		movement = Vector3(-speed,0,0)
	if (idx == 1) :
		movement = Vector3(speed,0,0)
	if (idx == 2) :
		movement = Vector3(0,speed,0)
	if (idx == 3) :
		movement = Vector3(0,-speed,0)
	
	$GridMap/CharacterBody3D.velocity = movement
	
	$GridMap/CharacterBody3D.move_and_slide()
	pass
###
 ### idenya adalah
### ada satu room yang buat test semua
### jadi ada beberapa test yang dilakukan dengan vr
### ini dan sekaligus mengetest seberapa bagus each approach
### kaya misalnya yang standar
### atau yang nanti di test pake flash card
### atau nanti juga di test menggunakan suara
### atau juga est mnggunakan huruf
###test menggunakan speech
###


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_instance()
	pass # Replace with function body.
