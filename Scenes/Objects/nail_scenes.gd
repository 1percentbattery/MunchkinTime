extends Node2D
@export var timePerNail : float = 0.5
@onready var boardList = [$Boards/Board1,$Boards/Board2,$Boards/Board3,$Boards/Board4]
@onready var displayList = [$Boards/Board1/Numbers1,$Boards/Board2/Numbers2,$Boards/Board3/Numbers3,$Boards/Board4/Numbers4]
@onready var hammer = $Hammer
var order = []
var numList = [0,1,2,3]
@export var amnt = 0.0
@export var on = false
func _ready():
	for board in boardList:
		board.play("default")
	for x in displayList:
		x.play("default")
	for x in randi_range(1,4):
		var ran = numList.pick_random()
		order += [ran]
		numList.erase(ran)
	for x in order.size():
		print(order[x])
		boardList[order[x]].play("Nail")
		displayList[order[x]].play(str(x))
		#order.size() * timePerNail
func start():
	$Timer.waitTime = timePerNail
	$Timer.start()
	on = true
func _physics_process(delta: float) -> void:
	$LightDefaultSquare.material.set_shader_parameter("amnt",amnt)
	if !on:
		return
	var directionHit : int = -1
	if Input.is_action_just_pressed("Up"):
		directionHit = 0
	if Input.is_action_just_pressed("Down"):
		directionHit = 2
	if Input.is_action_just_pressed("Left"):
		directionHit = 1
	if Input.is_action_just_pressed("Right"):
		directionHit = 3
	if directionHit >=0 :
		hammer.position=boardList[directionHit].position+Vector2(72,-63)
		$HamerHit.play("HammerHit")
	else:
		return
	if order[0] == directionHit:
		boardList[order[0]].play("Won")
		order.pop_front()
		if order.is_empty():
			win()
			return
	else:
		if order.has(directionHit):
			pass
		else:
			boardList[directionHit].play("Lost")
		lose()
func win():
	on = false
	$Win.play("Win")
func _on_win_animation_finished(anim_name: StringName) -> void:
	get_parent().win()
func lose():
	on = false
	get_parent().lose()
