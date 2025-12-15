extends Area2D
@export var damage = 100
func onHit(obj : Node2D):
	if obj.has_method("hit"):
		obj.hit(self,damage)
	pass
func hit(from,damage):
	pass
func _on_area_entered(area: Area2D) -> void:
	onHit(area)
func _on_body_entered(body: Node2D) -> void:
	onHit(body)
