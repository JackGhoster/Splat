extends Node2D

@export var character : CharacterBody2D
@export var speed : int = 100
@export var jumpForce : int = 100
@export var gravity : int = 100

@export var leftRay : RayCast2D
@export var rightRay : RayCast2D

var ThisVelocity : Vector2 = Vector2.ZERO
var inertiaWeight : float = 0.11
# Called when the node enters the scene tree for the first time.
func _ready():
	process_priority = 0

func _physics_process(delta):
	#gravity
	if not character.is_on_floor():
		ThisVelocity.y = ThisVelocity.y + (gravity * delta)
		
			
	
	#applying inertia
	character.velocity.x = lerp(character.velocity.x,ThisVelocity.x, inertiaWeight)
	
	character.velocity.y = ThisVelocity.y
	character.move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GetMovement()
	Jump()

func GetMovement():
	if not character.is_on_floor() and not character.is_on_wall():
		return
				
	if(Input.is_action_pressed("left")):
		ThisVelocity.x = -1 * speed
	elif(Input.is_action_pressed("right")):
		ThisVelocity.x = 1 * speed
	else:
		ThisVelocity.x = 0
		
func Jump():
	if(character.is_on_floor() and Input.is_action_just_pressed("jump")):
		ThisVelocity.y = -1 * jumpForce 
		
	if(leftRay.is_colliding()):
		if(Input.is_action_just_pressed("jump")):
			ThisVelocity.x = 1 * speed/2
			ThisVelocity.y = -1 * jumpForce * 1.3
	
	elif(rightRay.is_colliding()):
		if(Input.is_action_just_pressed("jump")):
			ThisVelocity.x = -1 * speed/2
			ThisVelocity.y = -1 * jumpForce * 1.3
			
		
