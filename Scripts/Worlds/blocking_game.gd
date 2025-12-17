extends Node2D

@onready var spawnerList = [$Spawners/objScroller_spawner3]

func _ready():
	start()
func _on_character_body_2d_area_entered(area: Area2D) -> void:
	lose()
func start():
	for item in spawnerList:
		item.on = true
	pass
func win():
	pass
func lose():
	pass
