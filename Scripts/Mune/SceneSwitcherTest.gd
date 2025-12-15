extends Node2D
@onready var Subviewport: SubViewport = $SubViewportContainer/SubViewport
const DINSOUR_GAME = preload("uid://c8vj5a6ienjsk")
const FALLING_OBJECTS = preload("uid://babybec8acwon")
const MURDER_PIM = preload("uid://bne2oqiiedlmb")

var games = [DINSOUR_GAME,FALLING_OBJECTS,MURDER_PIM]
var uninstantedgame
var prevgame
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	G.SceneSwitcher = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		switch()

func switch():
	
	var game = games[randf_range(0,games.size())].instantiate()
	uninstantedgame = game
	if prevgame != null:
		if prevgame == game:
			switch()
			print("same")
		prevgame.queue_free()
	prevgame = game
	Subviewport.add_child(game)
	print("switched")
