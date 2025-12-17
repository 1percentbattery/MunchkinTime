extends Node2D
@onready var TimerNode: Timer = $Timer
@onready var ProgressBarNode: TextureProgressBar = $TextureProgressBar
@export var time: int= 10
@export var QuitSceneOnTimeout: bool = false
@export var WinOnTimeout: bool = true
@onready var FuzeAnimation: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TimerNode.wait_time = time
	ProgressBarNode.max_value = time
func start():
	FuzeAnimation.speed_scale = 1 / TimerNode.wait_time
	FuzeAnimation.stop()
	FuzeAnimation.play("Fuzer")
	TimerNode.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ProgressBarNode.value = TimerNode.time_left
func _on_timer_timeout() -> void:
	if QuitSceneOnTimeout:
		G.lostGame()
	else:
		if WinOnTimeout:
			get_parent().win()
		else:
			get_parent().lose()
func stop():
	TimerNode.stop()


	
