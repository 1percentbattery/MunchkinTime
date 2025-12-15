extends Area2D
func _on_area_entered(area: Area2D) -> void:
	kill(area)
func _on_body_entered(body: Node2D) -> void:
	kill(body)
func kill(obj : Node2D):
	obj.queue_free()
