extends Node2D
@onready var Animations: AnimationPlayer = $Knife/AnimationPlayer
@onready var TimerScene: Node2D = $Node2D/Camera2D/Timer
@onready var PimIdle: TextureRect = $Pim/Idle
@onready var PimScream: TextureRect = $Pim/Screaming
@onready var PimDead: TextureRect = $Pim/Dead
@onready var IdleShaker: ShakerComponent2D = $Node2D/IdleShake
var hit: int = 15
var started: bool = false

func _process(delta: float) -> void:
	if started:
		if Input.is_action_just_pressed("Special"):
			if hit > 0:
				Animations.stop()
				Animations.play("Swing")
				hit -= 1
		
	if hit <= 0:
		PimDead.visible = true
		PimIdle.visible = false
		PimScream.visible = false
		IdleShaker.stop_shake()
		TimerScene.stop()
func start():
	TimerScene.TimerNode.start()
	started = true
