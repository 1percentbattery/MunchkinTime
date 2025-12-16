extends Node2D

@export var objList : Array[PackedScene] = [load("res://Scenes/Objects/block_1.tscn")]
@export var scrollSpeed := Vector2(-300,0)
@export var objFreq := 1.0
@export var rotSpeed := 45.0
@export var on := false
@export var spawnCounter := 0.0
var spawnList : Array
var spawnPoints : Array[Node2D]
func _ready():
	for child : Node2D in get_children():
		spawnPoints += [child]
		#child.look_at(self.global_position)
	if spawnPoints.is_empty():
		spawnPoints += [self]
func _physics_process(delta: float) -> void:
	#rotation_degrees += rotSpeed * delta
	if !on:
		return
	spawnCounter += delta
	if spawnCounter >= objFreq:
		spawnObj()
		spawnCounter -= objFreq
	for item in spawnList:
		move(item,delta)
func move(item : CollisionObject2D,delta : float):
	item.global_position += (scrollSpeed * delta).rotated(item.rotation)
func spawnObj():
	var tempObj: CollisionObject2D = objList.pick_random().instantiate()
	add_child(tempObj)
	var temp = spawnPoints.pick_random()
	tempObj.global_transform = temp.global_transform
	spawnList += [tempObj]
