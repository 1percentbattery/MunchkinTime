extends RigidBody2D
var FallingVelocity = 60.0
var RotationValue
const EXPLOSION = preload("uid://bcqqfvfhfsqe8")


func _ready() -> void:
	RotationValue = randi_range(-120,120)

func _process(delta: float) -> void:
	apply_torque_impulse(RotationValue) 
	
	


func _on_body_entered(body: Node) -> void:
	print(body)
	if body is StaticBody2D:
		var explosion = EXPLOSION.instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = self.global_position
	queue_free()
