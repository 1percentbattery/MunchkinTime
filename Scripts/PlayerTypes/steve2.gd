extends CharacterBody3D
@onready var Neck: Node3D = $Neck
@onready var Camera: Camera3D = $Neck/Camera
var mouse_sens: float = 0.4
var ground_lerp_speed = 14.0
var air_lerp_speed = 2.0
var lerp_speed = 15.0

var walking_speed = 4.0
var sprinting_speed = 5.0
var speed = 6.0
const JUMP_VELOCITY = 9.5
@onready var jumpcooldowntimer: Timer = $"../Timer"
@onready var shaker: ShakerComponent3D = $Neck/ShakerComponent3D
@onready var Hand: MeshInstance3D = $Neck/Camera/Hand
@onready var handshaker: ShakerComponent3D = $Neck/Camera/Hand/ShakerComponent3D
@onready var Collision: CollisionShape3D = $CollisionShape3D
@onready var SwingAnimation: AnimationPlayer = $Neck/Camera/Hand/AnimationPlayer

var gravity = 0.67
var hand_pos

func _ready() -> void:
	hand_pos = Hand.global_position
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x) * mouse_sens)
		Neck.rotate_x(deg_to_rad(-event.relative.y) * mouse_sens)
		Neck.rotation.x = clamp(Neck.rotation.x,deg_to_rad(-90),deg_to_rad(90))

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Click"):
		SwingAnimation.play("Swing")
	
	Collision.global_rotation.y = 0.0
	
	shaker.shake_speed = velocity.length() / 4 
	handshaker.shake_speed = velocity.length() / 4 
	

	if Input.is_action_pressed("sprint"):
		speed = sprinting_speed
		Camera.fov = lerp(Camera.fov,90.0,delta * 20)
	else:
		speed = walking_speed
		Camera.fov = lerp(Camera.fov,75.0,delta * 10)
	
	# Add the gravity.
	if not is_on_floor():
		shaker.shake_speed = 0
		lerp_speed = air_lerp_speed
		velocity.y -= gravity
	else:
		lerp_speed = ground_lerp_speed

	# Handle jump.
	if Input.is_action_pressed("Jump") and is_on_floor():
		if jumpcooldowntimer.time_left <= 0.0:
			velocity.y = JUMP_VELOCITY
			jumpcooldowntimer.start()
	if Input.is_action_just_released("Jump"):
		jumpcooldowntimer.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("Left", "Right", "Up", "Down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = lerp(velocity.x,direction.x * speed,delta * lerp_speed)
		velocity.z = lerp(velocity.z,direction.z * speed,delta * lerp_speed)
	else:
		velocity.x = lerp(velocity.x,move_toward(velocity.x, 0, speed),delta * lerp_speed)
		velocity.z = lerp(velocity.z,move_toward(velocity.z, 0, speed),delta * lerp_speed)

	move_and_slide()
