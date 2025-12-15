extends Node2D
const SHMALOOGLE = preload("uid://c6yjl7ftjfimr")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_delay_timer_timeout() -> void:
	var smoog = SHMALOOGLE.instantiate()
	self.add_child(smoog)
	smoog.global_position = Vector2(randf_range(10,1910),50.0)
