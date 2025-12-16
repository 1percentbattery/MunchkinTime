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

var hit: int = 15
var started: bool = false

func _ready() -> void:
	G.CurrentGame = self
	EndFadeout.visible = false
	HitFade.visible = false
func _process(delta: float) -> void:
	if started:
		if Input.is_action_just_pressed("Special"):
			if hit > 0:
				var blood = BLOOD.instantiate()
				self.add_child(blood)
				blood.global_position = Vector2(594,760)
				blood.emitting = true
				Animations.stop()
				Animations.play("Swing")
				hit -= 1
	if hit <= 0:
		PimDead.visible = true
		PimIdle.visible = false
		PimScream.visible = false
		IdleShaker.stop_shake()
		TimerScene.stop()
		end()
func start():
	TimerScene.TimerNode.start()
	started = true
	
func end():
	
	EndAnimation.play("End")
	EndFadeout.visible = true

func lose():
	G.SceneSwitcher.Lives -= 1
	PimIdle.hide()
	PimScream.hide()
	PimSad.show()
	TimerScene.stop()
	Knife.hide()
	await get_tree().create_timer(2.0).timeout
	G.lostGame()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	G.wonGame()
