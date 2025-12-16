extends Node2D


func start():
	
	
	pass
	
func win():
	$Timer.hide()
	
func lose():
	$Timer.hide()
	
	print("loss")
func _on_win_box_body_entered(body: Node2D) -> void:
	win()
func _on_win_box_area_entered(area: Area2D) -> void:
	win()
