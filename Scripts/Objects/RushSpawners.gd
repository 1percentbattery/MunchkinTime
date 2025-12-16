extends Node2D
@export var rushMod := 2.0
@export var timer := 1.0

var spawners = []
var done = false
func _ready():
	spawners = get_children()
	for spawner in spawners:
		spawner.scrollSpeed *= rushMod
		spawner.objFreq /= rushMod
func _physics_process(delta: float) -> void:
	if done:
		return
	timer -= delta
	if timer <= 0.0:
		done = true
		for spawner in spawners:
			spawner.scrollSpeed /= rushMod
			spawner.objFreq *= rushMod
