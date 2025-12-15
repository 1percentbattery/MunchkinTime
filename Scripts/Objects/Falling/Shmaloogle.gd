extends RigidBody2D
var FallingVelocity = 60.0
var RotationValue


func _ready() -> void:
	RotationValue = randi_range(-120,120)

func _process(delta: float) -> void:
	apply_torque_impulse(RotationValue) 
	
	


func _on_body_entered(body: Node) -> void:
	queue_free()
