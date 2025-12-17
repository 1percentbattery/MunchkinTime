extends Node
var CurrentGame = null
var SceneSwitcher :sceneSwitcher= null
var Score = 0
var Lives = 3
var WonGames = 0
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	pass
func lostGame():
	SceneSwitcher.switch()
	Lives -= 1
func wonGame():
	if WonGames%5 == 0 and WonGames != 0:
		Engine.time_scale += 0.3
	WonGames += 1
	SceneSwitcher.switch()
	Score += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
