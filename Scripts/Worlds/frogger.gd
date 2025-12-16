extends Node2D

func _ready():
	$Timer.hide()
	$WinBackground2.hide()
func start():
	#await get_tree().create_timer(1.0).timeout
	$CharacterBody2D.on = true
	$Timer.show()
	$Timer.start()
func win():
	$Timer.hide()
	$Spawners.queue_free()
	$decoration.queue_free()
	$WinBox.queue_free()
	$CharacterBody2D.position = Vector2(960,540)
	
func lose():
	$Spawners.set_process_mode(ProcessMode.PROCESS_MODE_DISABLED)
	$CharacterBody2D.set_process_mode(ProcessMode.PROCESS_MODE_DISABLED)
	$WinBackground2.show()
	$Timer.hide()
	$AnimationPlayer.play("Loser")
func _on_win_box_body_entered(body: Node2D) -> void:
	win()
func _on_win_box_area_entered(area: Area2D) -> void:
	win()
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Loser":
		G.lostGame()
	else:
		G.wonGame()
