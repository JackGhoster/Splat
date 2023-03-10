extends Camera2D

@export var followTarget : Node2D

var interpolationWeight : float = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	process_priority = 1
	if followTarget == null:
		return
	position = followTarget.position
	

func _physics_process(delta):
	if followTarget == null:
		return
	position = lerp(position, followTarget.position, interpolationWeight)
# Called every frame. 'delta' is the elapsed time since the previous frame.
