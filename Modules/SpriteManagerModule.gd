extends Node2D

@export var character : CharacterBody2D
@export var aSprite : AnimatedSprite2D

var animationList = ["Idle", "Run", "Jump"]
enum {Idle, Run, Jump}

# Called when the node enters the scene tree for the first time.
func _ready():
	aSprite.animation = animationList[Idle]
	aSprite.play()

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Flipping()
	AnimationChanging()
	
func Flipping():
	if character.velocity.x < 0:
		aSprite.flip_h = true
		aSprite.offset.x = -5
	elif character.velocity.x > 0:
		aSprite.flip_h = false
		aSprite.offset.x = 5

func AnimationChanging():
	if character.velocity.x > 10 or character.velocity.x < -10:
		aSprite.animation = animationList[Run]
	else:
		aSprite.animation = animationList[Idle]
