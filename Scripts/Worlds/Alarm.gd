extends Node2D
@onready var Cursor: Area2D = $Cursor
@onready var ColorButton: ColorRect = $Area2D/ColorRect
@onready var Snooze: Area2D = $Node2D/Snooze
@onready var Stop: Area2D = $Node2D/Stop
@onready var TimerScene: Node2D = $Timer
var started = false
@onready var Blur: TextureRect = $TextureRect

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
	await get_tree().create_timer(2.0).timeout
	G.wonGame()
func lose():
	TimerScene.stop()
	TimerScene.hide()
	await get_tree().create_timer(2.0).timeout
	G.lostGame()

## Creates a PlayStation 2-like accumulation motion blur effect.
##
## Add to _process(). The frame blending effect is applied to the area 
## within the boundaries of the texture_rect node.
## It is recommended to only set the alpha from 0 to less than 1.
