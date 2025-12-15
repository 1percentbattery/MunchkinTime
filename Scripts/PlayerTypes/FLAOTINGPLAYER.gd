extends CharacterBody2D
class_name floatingBody
var Speed: int = 1000
@export var WalkSpeed: int = 1000
@export var SprintSpeed: int = 2000
@export var MovementLerpSpeed: float = 8.0
@export var CanSprint: bool = true

func _physics_process(delta: float) -> void:
	#MOVEMENT
	
	var direction = Input.get_vector("Left","Right","Up","Down")
	if direction:
		velocity.x = lerp(velocity.x,direction.x * Speed,delta * MovementLerpSpeed)
		velocity.y = lerp(velocity.y,direction.y * Speed,delta * MovementLerpSpeed)
	else:
		velocity.y = lerp(velocity.y, move_toward(velocity.y, 0, Speed),delta * MovementLerpSpeed)
		velocity.x = lerp(velocity.x, move_toward(velocity.x, 0, Speed),delta * MovementLerpSpeed)
	if CanSprint:
		if Input.is_action_pressed("Sprint"):
			Speed = lerp(Speed,SprintSpeed,delta * MovementLerpSpeed)
		else:
			Speed = lerp(Speed,WalkSpeed,delta * MovementLerpSpeed)
	
	move_and_slide()
