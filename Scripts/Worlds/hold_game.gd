extends Node2D
@export var speedMod := 0.5
var on = false
var barList = []
var targets = []
@onready var indicator = $Indicator
var currentLevel : float = 0.0
var currentBar : int = -1
@warning_ignore("shadowed_global_identifier")
@export var range : float = 0.1#either side
@export var amnt = 0.0
@export var evilAmnt = 0.0
func _ready():
	$EvilLightDefaultSquare.hide()
	for bar in $Bars.get_children():
		bar.material.set_shader_parameter("showFrom",0.0)
		barList += [bar]
		targets += [randf_range(0.25,1.0)]
	nextBar()
func _process(delta: float) -> void:
	$LightDefaultSquare.material.set_shader_parameter("amnt",amnt)
	$EvilLightDefaultSquare.material.set_shader_parameter("amnt",evilAmnt)
	if !on:
		return
	currentLevel = currentLevel + delta * speedMod
	barList[currentBar].material.set_shader_parameter("showTo",currentLevel)
	if currentLevel > targets[currentBar] + range:
		lose()
		return
	if Input.is_action_just_pressed("Special"):
		if currentLevel > targets[currentBar] - range:
			nextBar()
			$AnimationPlayer.play("Good")
		else:
			lose()
func nextBar():
	currentLevel = 0.0
	currentBar += 1
	if currentBar >= barList.size():
		win()
		return
	indicator.global_position = barList[currentBar].global_position
	indicator.material.set_shader_parameter("showTo",targets[currentBar] + range)
	indicator.material.set_shader_parameter("showFrom",targets[currentBar] - range)
func start():
	on = true
func win():
	on = false
	$Indicator.hide()
	#$AnimationPlayer.clear_queue()
	$WinAnimation.play("Win")
func lose():
	$EvilLightDefaultSquare.show()
	$LoseAnimation.play("Lose")
	on = false
func _on_win_animation_animation_finished(anim_name: StringName) -> void:
	G.wonGame()
func _on_lose_animation_animation_finished(anim_name: StringName) -> void:
	G.lostGame()
