class_name sceneSwitcher
extends Node2D
@onready var Subviewport: SubViewport = $SubViewportContainer/SubViewport
const WOW = preload("res://Scenes/Worlds/wow.tscn")
const FALLING_OBJECTS = preload("uid://babybec8acwon")
const MURDER_PIM = preload("uid://bne2oqiiedlmb")
@onready var ScoreCounter: Label = $Label
@onready var LivesCounter: Label = $Lives
@onready var Video: VideoStreamPlayer = $VideoStreamPlayer
@onready var TransitionAnimation: AnimationPlayer = $AnimationPlayer

@onready var _1: TextureRect = $"Node2D/1"
@onready var _2: TextureRect = $"Node2D/2"
@onready var _3: TextureRect = $"Node2D/3"


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
		
	if G.Lives ==2:
		_3.hide()
	if G.Lives == 1:
		_2.hide()
		
	ScoreCounter.text = str(G.Score)
	
	if G.Lives <= 0:
		_1.hide()
		get_tree().quit()
func switch():
	get_tree().paused = true
	TransitionAnimation.play("Transition")
	await get_tree().create_timer(0.3).timeout
	if global_game != null:
		previous_game = global_rng
		global_game.queue_free()
	var rng = randi_range(0,games.size()-1)
	print(rng,", ", games)
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
	await get_tree().create_timer(0.9).timeout
	get_tree().paused = false
	
func playvideo():
	Video.paused = false
func restartvideo():
	Video.loop = true
	Video.paused = true

func play_sound():
	$NewGameStart.play()
