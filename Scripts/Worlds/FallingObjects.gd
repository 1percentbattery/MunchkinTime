extends Node2D
@onready var TimerScene: Node2D = $Timer
@onready var Video: VideoStreamPlayer = $Walls/Charlie
@onready var WinAnimation: AnimationPlayer = $WinAnimation/AnimationPlayer
const SHMALOOGLE = preload("uid://c6yjl7ftjfimr")
var spawning: bool = false
var count: int = 0
var won = false
@onready var winlose_indicator: Node2D = $WinloseIndicator
@onready var Music: AudioStreamPlayer = $Shmaloogle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	G.CurrentGame = self
func _on_spawn_delay_timer_timeout() -> void:
	if spawning:
		var smoog = SHMALOOGLE.instantiate()
		self.add_child(smoog)
		smoog.global_position = Vector2(randf_range(170,1750),-50.0)
func start():
	spawning = true
	TimerScene.TimerNode.start()
func win():
	won = true
	spawning = false
	WinAnimation.play("Win")
	winlose_indicator.win()
	for object in get_tree().get_nodes_in_group("Objective"):
		object.queue_free()
func end():
	if won:
		G.wonGame()
	else:
		G.lostGame()
func lose():
	await get_tree().create_timer(4.0).timeout
	end()
