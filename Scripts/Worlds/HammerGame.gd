extends Node2D
class_name HammerGameScript
@export var timePerNail : float = 3.0
@export var goal : int = 3
var nailScene : PackedScene = load("res://Scenes/Objects/nail_scenes.tscn")
var curScene : Node2D = null
var curPoints : int = -1
var on = false
func _ready():
	nextScene()
	start()
func start():
	on = true
	curScene.start()
func nextScene():
	curPoints += 1
	if curPoints >= goal:
		win()
		return
	if curScene:
		curScene.queue_free()
	var tempObj: Node2D = nailScene.instantiate()
	tempObj.timePerNail = timePerNail
	add_child(tempObj)
	curScene = tempObj
	if on:
		curScene.start()
func win():
	pass
func lose():
	pass
