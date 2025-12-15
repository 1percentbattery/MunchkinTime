extends Node2D
@onready var TimerScene: Node2D = $Timer
@onready var Video: VideoStreamPlayer = $Walls/Charlie
@onready var WinAnimation: AnimationPlayer = $WinAnimation/AnimationPlayer
const SHMALOOGLE = preload("uid://c6yjl7ftjfimr")
var spawning: bool = false
var count: int = 0



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
	G.SceneSwitcher.Score += 1
	spawning = false
	WinAnimation.play("Win")
	for object in get_tree().get_nodes_in_group("Objective"):
		object.queue_free()
	
func end():
	G.SceneSwitcher.switch()

func lose():
	await get_tree().create_timer(4.0).timeout
	G.SceneSwitcher.switch()
