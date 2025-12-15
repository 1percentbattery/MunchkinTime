extends Node2D
var lost  =false
func win():
	if !lost:
		$CharacterBody2D/Sprite2D.play("WOW")
		$WinAnimation.play("WOWAnimation")
		$objScroller_spawner.queue_free()
func lose():
	lost = true
	$CharacterBody2D/Sprite2D.play("WOW")
	$objScroller_spawner.queue_free()
	$LightDefaultSquare.material.set_shader_parameter("add",Vector4(0,-1,-1,0))
	$loseAnimation.play("WOWyoulost")
func start():
	$objScroller_spawner.on = true
	$Timer.start()

func _ready() -> void:
	$CharacterBody2D.whereToSendLose = self
	$CharacterBody2D/Sprite2D.play("default")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
func _on_lose_animation_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
