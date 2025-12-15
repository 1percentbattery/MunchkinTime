extends Node2D
var lost  =false
func win():
	if !lost:
		$CharacterBody2D/Sprite2D.play("WOW")
		$WinAnimation.play("WOWAnimation")
		$objScroller_spawner.queue_free()
func lose():
	lost = true
	$objScroller_spawner.queue_free()
	
func start():
	$objScroller_spawner.on = true
	$Timer.start()
func _ready() -> void:
	$CharacterBody2D.whereToSendLose = self
	G.CurrentGame = self
	$CharacterBody2D/Sprite2D.play("default")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
