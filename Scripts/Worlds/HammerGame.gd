extends Node2D
class_name HammerGameScript
@export var timePerNail : float = 0.5
@export var goal : int = 3
var nailScene : PackedScene
var curScene : Node2D = null
var curPoints : int = 0
func _ready():
	
	pass
func nextScene():
	if curScene:
		curScene.queue_free()
	var tempObj: Node2D = nailScene.instantiate()
	add_child(tempObj)
	curScene = tempObj
	curPoints += 1
	if curPoints >= goal:
		win()
func win():
	pass
func lose():
	pass
