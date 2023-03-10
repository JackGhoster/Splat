extends Node2D

var score = 0
var timer = 0 
var deaths = 0
var isEnded = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isEnded == false:
		timer += delta
	Restart()
	
func Restart():
	if Input.is_action_just_pressed("restart"):
		GameManager.score = 0
		GameManager.timer = 0
		get_tree().reload_current_scene()
	
