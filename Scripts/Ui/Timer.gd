extends Node2D
@onready var TimerNode: Timer = $Timer
@onready var ProgressBarNode: ProgressBar = $ProgressBar
@export var time: int= 10
@export var QuitSceneOnTimeout: bool = false
@export var WinOnTimeout: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TimerNode.wait_time = time
	ProgressBarNode.max_value = time
func start():
	TimerNode.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ProgressBarNode.value = TimerNode.time_left
func _on_timer_timeout() -> void:
	if QuitSceneOnTimeout:
		G.SceneSwitcher.switch()
	else:
		if WinOnTimeout:
			G.CurrentGame.win()
		else:
			G.CurrentGame.lose()
		
func stop():
	TimerNode.stop()
