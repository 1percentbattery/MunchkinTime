extends Node2D
func win():
	pass
func start():
	$objScroller_spawner.on = true
	$Timer.start()
func _ready() -> void:
	G.CurrentGame = self
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	
	pass # Replace with function body.
