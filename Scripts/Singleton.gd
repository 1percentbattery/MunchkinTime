extends Node
var CurrentGame = null
var SceneSwitcher :sceneSwitcher= null
var Score = 0
var Lives = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func lostGame():
	SceneSwitcher.switch()
	Lives -= 1
func wonGame():
	SceneSwitcher.switch()
	Score += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
