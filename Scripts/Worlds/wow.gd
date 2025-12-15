extends Node2D
func win():
	$CharacterBody2D/Sprite2D.play("WOW")
	$WinAnimation.active = true
func lose():
	
	
	print("loss")
func start():
	$objScroller_spawner.on = true
	$Timer.start()
func _ready() -> void:
	$CharacterBody2D.whereToSendLose = self
	$WinAnimation.active = false
	G.CurrentGame = self
	$CharacterBody2D/Sprite2D.play("default")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
