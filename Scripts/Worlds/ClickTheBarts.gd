extends Node2D
@onready var BartSpawner: Marker2D = $BartSpawner
@onready var BartSpawnDelay: Timer = $BartSpawnDelay
const BART = preload("uid://d27n1yk5o3q4u")
@onready var TimerScene: Node2D = $Timer
@onready var Lose: ColorRect = $Lose
@onready var Win: TextureRect = $Win

var barts = 7
var can_spawn = false
var won = false
var lost = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_bart_spawn_delay_timeout() -> void:
	if can_spawn:
		if barts > 0:
			var bart = BART.instantiate()
			self.add_child(bart)
			bart.global_position = BartSpawner.global_position
			barts -= 1

func _process(delta: float) -> void:
	if can_spawn == true:
		if get_tree().get_nodes_in_group("Bart").is_empty():
			print("no barts left")
			if won == false:
				win()
				won = true
				lost = false

func start():
	var bart = BART.instantiate()
	self.add_child(bart)
	bart.global_position = BartSpawner.global_position
	barts -= 1
	can_spawn = true
	TimerScene.start()

func win():
	won = true
	lost = false
	if won:
		Win.show()
		TimerScene.stop()
		TimerScene.hide()
		await get_tree().create_timer(2.0).timeout
		G.wonGame()
	
func lose():
	won = false
	lost = true
	if lost: 
		Lose.show()
		TimerScene.stop()
		TimerScene.hide()
		for barts in get_tree().get_nodes_in_group("Bart"):
			barts.hide()
		await get_tree().create_timer(2.0).timeout
		G.lostGame()
