extends Node2D

@onready var spawnerList = [$Spawners/objScroller_spawner3,$Spawners/objScroller_spawner4]
@export var on = false
@export var freq = 1.0
var counter = 0.0
func _ready():
	pass
func _process(delta: float) -> void:
	if !on:
		return
	counter += delta
	if counter >= freq:
		counter -= freq
		spawnerList.pick_random().spawnObj()
	if Input.is_action_just_pressed("Left"):
		var areas: Array = $Area2DL.get_overlapping_areas()
		if areas.is_empty():
			lose()
		else:
			for area in areas:
				area.queue_free()
	if Input.is_action_just_pressed("Right"):
		var areas: Array = $Area2DR.get_overlapping_areas()
		if areas.is_empty():
			lose()
		else:
			for area in areas:
				area.queue_free()
func _on_character_body_2d_area_entered(area: Area2D) -> void:
	lose()
func start():
	on = true
	for item in spawnerList:
		item.on = true
func win():
	pass
	#on = false
func lose():
	pass
	#on = false
