extends Node2D
const KNIFE = preload("res://Scenes/Objects/Knife.tscn")
@onready var Jerma: TextureRect = $Node2D/TextureRect
@onready var BoardArea: Area2D = $Node2D/TextureRect/Area2D
@onready var JermaArea: Area2D = $Node2D/TextureRect/JermaArea
@onready var winlose_indicator: Node2D = $WinloseIndicator
@onready var TimerScene: Node2D = $Timer
var won = false
@onready var JermaShaker: ShakerComponent2D = $Node2D/ShakerComponent2D
@onready var Animations: AnimationPlayer = $AnimationPlayer
@onready var loseaudio: AudioStreamPlayer = $lose

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _process(delta: float) -> void:
	if won == false:
		Jerma.rotation += 2.0 * delta
	for knifes in JermaArea.get_overlapping_areas():
		if knifes.is_in_group("Knife"):
			if JermaArea.get_overlapping_areas().size() > 29:
				if won == false:
					win()
					won = true
	
	if Input.is_action_just_pressed("Special"):
		if won == false:
			var knife = KNIFE.instantiate()
			self.add_child(knife)
			knife.global_position = get_global_mouse_position()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Knife"):
		area.reparent(Jerma)


func _on_jerma_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Knife"):
		area.reparent(Jerma)
		print("jermad")
		JermaShaker.play_shake()
		area.bloody = true

func start():
	TimerScene.start()

func win():
	winlose_indicator.win()
	TimerScene.stop()
	TimerScene.hide()
	await get_tree().create_timer(2.0).timeout
	G.wonGame()
	
func lose():
	Animations.play("Lose")
	loseaudio.play()
	winlose_indicator.lose()
	await get_tree().create_timer(4.0).timeout
	G.lostGame()
