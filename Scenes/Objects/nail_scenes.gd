extends Node2D
@export var timePerNail : float = 0.5
@onready var boardList = [$Boards/Board1,$Boards/Board2,$Boards/Board3,$Boards/Board4]
var order = []
var numList = [0,1,2,3]

func _ready():
	for board in boardList:
		board.play("default")
	for x in randi_range(1,4):
		var ran = numList.pick_random()
		order += [ran]
		numList.erase(ran)
	for x in order.size():
		print(order[x])
		boardList[order[x]].play("Nail")
		
	
