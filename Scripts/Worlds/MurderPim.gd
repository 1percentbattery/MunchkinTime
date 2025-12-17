extends Node2D
@onready var Animations: AnimationPlayer = $Knife/AnimationPlayer
@onready var TimerScene: Node2D = $Node2D/Camera2D/Timer
@onready var PimIdle: TextureRect = $Pim/Idle
@onready var PimScream: TextureRect = $Pim/Screaming
@onready var PimDead: TextureRect = $Pim/Dead
@onready var PimSad: TextureRect = $Pim/Sad
@onready var IdleShaker: ShakerComponent2D = $Node2D/IdleShake
@onready var EndAnimation: AnimationPlayer = $Node2D2/AnimationPlayer
@onready var EndFadeout: ColorRect = $Node2D2/ColorRect
@onready var HitFade: ColorRect = $ColorRect
const BLOOD = preload("res://Scenes/Effects/BloodParticles.tscn")
@onready var Knife: Sprite2D = $Knife/Knife
@onready var winlose_indicator: Node2D = $WinloseIndicator

var hit: int = 15
var started: bool = false

func _ready() -> void:
	G.CurrentGame = self
	EndFadeout.visible = false
	HitFade.visible = false
func _process(delta: float) -> void:
	if started:
		if Input.is_action_just_pressed("Special"):
			if hit > 0 and hit < 100:
				$Stab.play()
				var blood = BLOOD.instantiate()
				self.add_child(blood)
				blood.global_position = Vector2(594,760)
				blood.emitting = true
				Animations.stop()
				Animations.play("Swing")
				hit -= 1
			else:
				PimDead.visible = true
				PimIdle.visible = false
				PimScream.visible = false
				
	if hit <= 0:
		PimDead.visible = true
		PimIdle.visible = false
		PimScream.visible = false
		IdleShaker.stop_shake()
		TimerScene.stop()
		end()
		winlose_indicator.win()
		hit = 200000
	if hit > 200:
		$KillPim.volume_db = lerp($KillPim.volume_db,-50.0,delta * 0.7)
func start():
	TimerScene.TimerNode.start()
	started = true
	
func end():
	
	EndAnimation.play("End")
	EndFadeout.visible = true

func lose():
	PimIdle.hide()
	PimScream.hide()
	PimSad.show()
	TimerScene.stop()
	Knife.hide()
	await get_tree().create_timer(2.0).timeout
	G.lostGame()
	winlose_indicator.lose()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	G.wonGame()
