extends Node2D
@onready var spawnerList = [$Spawners/objScroller_spawner3,$Spawners/objScroller_spawner4]
@export var on = false
@export var freq = 0.5

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
			pass
			#lose()
		else:
			for area in areas:
				area.global_position = Vector2(0,3000)
	if Input.is_action_just_pressed("Right"):
		var areas: Array = $Area2DR.get_overlapping_areas()
		if areas.is_empty():
			pass
			#lose()
		else:
			for area in areas:
				area.global_position = Vector2(0,3000)
func _on_character_body_2d_area_entered(area: Area2D) -> void:
	lose()
func start():
	$Timer.start()
	on = true
	for item in spawnerList:
		item.on = true
func win():
	$Timer.hide()
	on = false
	G.wonGame()
func lose():
	$Pirate.show()
	$Label.show()
	$Timer.hide()
	on = false
	await get_tree().create_timer(1.0).timeout
	G.lostGame()
