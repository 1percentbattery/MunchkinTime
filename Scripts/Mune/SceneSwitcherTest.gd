class_name sceneSwitcher
extends Node2D
@onready var Subviewport: SubViewport = $SubViewportContainer/SubViewport
const WOW = preload("res://Scenes/Worlds/wow.tscn")
const FALLING_OBJECTS = preload("uid://babybec8acwon")
const MURDER_PIM = preload("uid://bne2oqiiedlmb")
@onready var ScoreCounter: Label = $Label
@onready var LivesCounter: Label = $Lives

var games = []
var global_game
var global_rng
var previous_game 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	G.SceneSwitcher = self
	findlevels("res://Scenes/Worlds/")
	print(games)
	switch()

func findlevels(path):
	var dir = DirAccess.open(path)
	if dir:
		var potential = dir.get_files()
		for file in potential:
			games += [path + "/" +file]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Debug"):
		switch()
	ScoreCounter.text = str(G.Score)
	LivesCounter.text = str(G.Lives)
	
	if G.Lives <= 0:
		get_tree().quit()
func switch():
	if global_game != null:
		previous_game = global_rng
		global_game.queue_free()
	var rng = randi_range(0,games.size()-1)
	var temp = load(games[rng])
	print(temp)
	var game = temp.instantiate()
	global_game = game
	global_rng = rng
	if previous_game == rng:
		print("SAME SAME")
		switch()
	Subviewport.add_child(game)
	print(rng)
	print(previous_game)
	
