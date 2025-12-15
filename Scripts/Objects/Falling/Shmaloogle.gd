extends RigidBody2D
var FallingVelocity = 60.0
var RotationValue
const EXPLOSION = preload("uid://bcqqfvfhfsqe8")


func _ready() -> void:
	RotationValue = randi_range(-120,120)

func _process(_delta: float) -> void:
	apply_torque_impulse(RotationValue) 
	
func _on_body_entered(body: Node) -> void:
	print(body)
	if body is StaticBody2D:
		var explosion = EXPLOSION.instantiate()
		get_parent().add_child(explosion)
		explosion.global_position = self.global_position
		get_parent().TimerScene.stop()
		get_parent().spawning = false
		get_parent().Video.visible = true
		get_parent().Video.paused = false
		get_parent().lose()
		G.SceneSwitcher.Lives -= 1
		for object in get_tree().get_nodes_in_group("Objective"):
			object.queue_free()
		
	queue_free()
