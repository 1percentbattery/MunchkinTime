extends CharacterBody2D

var Speed: int = 1000
@export var WalkSpeed: int = 1000
@export var SprintSpeed: int = 2000
@export var MovementLerpSpeed: float = 8.0

@export var JumpHeight: int = 700

@export var Gravity: float = 20.0

@export var CanSprint: bool = true
@export var CanJump: bool = true

func _physics_process(delta: float) -> void:
	#GRAVITY
	if not is_on_floor():
		if velocity.y < 0.0:
			velocity.y += Gravity
		else:
			velocity.y += Gravity * 1.5

	#JUMP
	if CanJump:
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = -JumpHeight

	#MOVEMENT
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = lerp(velocity.x,direction * Speed,delta * MovementLerpSpeed)
	else:
		velocity.x = lerp(velocity.x, move_toward(velocity.x, 0, Speed),delta * MovementLerpSpeed)
	
	if CanSprint:
		if Input.is_action_pressed("Sprint"):
			Speed = lerp(Speed,SprintSpeed,delta * MovementLerpSpeed)
		else:
			Speed = lerp(Speed,WalkSpeed,delta * MovementLerpSpeed)
	
	move_and_slide()
