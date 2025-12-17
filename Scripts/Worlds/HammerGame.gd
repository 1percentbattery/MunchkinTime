extends Node2D
class_name HammerGameScript
@export var timePerNail : float = 3.0
@export var goal : int = 3
var nailScene : PackedScene = load("res://Scenes/Objects/nail_scenes.tscn")
var curScene : Node2D = null
var curPoints : int = -1
var on = false

@export var amntR = 0.0
@export var amntL = 0.0
func setShaders():
	$Blood2.material.set_shader_parameter("showTo",amntR)
	$Blurd.material.set_shader_parameter("showFrom",1-amntL)
func _process(delta: float) -> void:
	setShaders()
func _ready():
	$Blood2.material.set_shader_parameter("showFrom",0.0)
	$Blurd.material.set_shader_parameter("showTo",1.0)
	nextScene()
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
	curScene.queue_free()
	$Win.play("Win")
func lose():
	curScene.queue_free()
	$Lose.play("Lose")
func _on_lose_animation_finished(anim_name: StringName) -> void:
	G.lostGame()
func _on_win_animation_finished(anim_name: StringName) -> void:
	G.wonGame()
