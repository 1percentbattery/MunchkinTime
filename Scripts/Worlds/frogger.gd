extends Node2D

func _ready():
	$Timer.hide()
func start():
	#await get_tree().create_timer(1.0).timeout
	$CharacterBody2D.on = true
	$Timer.show()
	$Timer.start()
func win():
	$Timer.hide()
	
	G.wonGame()
func lose():
	$Timer.hide()
	
	G.lostGame()
func _on_win_box_body_entered(body: Node2D) -> void:
	win()
func _on_win_box_area_entered(area: Area2D) -> void:
	win()
