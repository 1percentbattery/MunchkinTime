extends Node2D
@onready var Cursor: Area2D = $Cursor
@onready var ColorButton: ColorRect = $Area2D/ColorRect
@onready var Snooze: Area2D = $Node2D/Snooze
@onready var Stop: Area2D = $Node2D/Stop
@onready var TimerScene: Node2D = $Timer
var started = false
@onready var Blur: TextureRect = $TextureRect
@onready var PhoneShake: ShakerComponent2D = $Node2D/ShakerComponent2D
@onready var HandShake1: ShakerComponent2D = $Cursor/ShakerComponent2D
@onready var HandShake2: ShakerComponent2D = $Cursor/Node2D/ShakerComponent2D
@onready var BGShake: ShakerComponent2D = $Node2D2/ShakerComponent2D
@onready var Animations: AnimationPlayer = $AnimationPlayer

var wasd_movement_speed = 15.0

var CursorDelta = Vector2.ZERO



func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		Cursor.global_position += event.relative

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("Up"):
		Cursor.global_position.y -= wasd_movement_speed
	if Input.is_action_pressed("Down"):
		Cursor.global_position.y += wasd_movement_speed
	if Input.is_action_pressed("Left"):
		Cursor.global_position.x -= wasd_movement_speed
	if Input.is_action_pressed("Right"):
		Cursor.global_position.x += wasd_movement_speed
	
	
	for body in Snooze.get_overlapping_areas():
		if body.is_in_group("Cursor"):
			if Input.is_action_just_pressed("Special"):
				win()
				
	for body in Stop.get_overlapping_areas():
		if body.is_in_group("Cursor"):
			if Input.is_action_just_pressed("Special"):
				lose()
				
func start():
	TimerScene.TimerNode.start()
	started = true
	
func win():
	TimerScene.stop()
	TimerScene.hide()
	Animations.play("Win")
	fadeout()
	await get_tree().create_timer(4.4).timeout
	G.wonGame()
	
	
func lose():
	TimerScene.stop()
	TimerScene.hide()
	Animations.play("Lose")
	fadeout()
	await get_tree().create_timer(4.4).timeout
	G.lostGame()
	

func fadeout():
	PhoneShake.stop_shake()
	HandShake1.stop_shake()
	HandShake2.stop_shake()
	BGShake.stop_shake()
