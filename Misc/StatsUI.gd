extends CanvasLayer

@export var score : Label
@export var timer : Label
@export var deaths : Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score.text = str(GameManager.score)
	timer.text = str(round(GameManager.timer))
	deaths.text = str(GameManager.deaths)
