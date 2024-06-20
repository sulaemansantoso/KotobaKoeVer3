extends Node3D

@export
var  collectibleScene : PackedScene
var  collectibleInstance  : Area3D


enum Movement {
	up,
	down,
	left,
	right
};

# Called when the node enters the scene tree for the first time.
func _ready():
	$SpawnTimer.start()
	pass # Replace with function body.

func move_character(direction : Movement )->void :
	var velo : Vector3 = Vector3(0,0,0)
	match (direction) :
		Movement.up : 
			velo = Vector3(0,2,0)
		Movement.down : 
			velo = Vector3(0,-2,0)
		Movement.left : 
			velo = Vector3(-2,0,0)
		Movement.right : 
			velo = Vector3(2,0,0)
		_ : 
			velo = Vector3(0,0,0)
	$Player.velocity = velo
	$Player.move_and_slide()		
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


func _on_spawn_timer_timeout():
	if (collectibleInstance != null) :
		collectibleInstance = collectibleScene.instantiate()
		var pos_X = randi() % 36 - 18
		var pos_Y = randi() % 36 - 18 
		collectibleInstance.transform.origin = Vector3(pos_X, pos_Y,0)
		collectibleInstance.connect("body_entered", on_collectible_body_enter)
		$SpawnTimer.stop()
	pass # Replace with function body.

func start_timer() :
	$SpawnTimer.start()

func on_collectible_body_enter() :
	collectibleInstance.queue_free()
	collectibleInstance = null
	$SpawnTimer.start()
	pass
