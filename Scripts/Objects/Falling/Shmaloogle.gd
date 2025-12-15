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
		G.CurrentGame.TimerScene.stop()
		G.CurrentGame.spawning = false
		G.CurrentGame.Video.visible = true
		G.CurrentGame.Video.paused = false
		for object in get_tree().get_nodes_in_group("Objective"):
			object.queue_free()
		G.CurrentGame.lose()
	if body is CharacterBody2D:
		G.CurrentGame.count += 1.0
	queue_free()
