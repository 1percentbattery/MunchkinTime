extends Area2D
@export var speed = Vector2(300,0)

func _physics_process(delta: float) -> void:
	var char = get_overlapping_bodies()
	for item in char:
		if item is CharacterBody2D:
			item.position += speed * delta
