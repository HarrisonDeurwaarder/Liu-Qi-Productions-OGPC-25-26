extends CharacterBody2D

@export var step_size: float = 64.0  # how far to move per press
@export var move_time: float = 0.1   # how fast the hop happens

var target_position: Vector2
var is_moving: bool = false

func _ready() -> void:
	target_position = position

func _process(delta: float) -> void:
	if not is_moving:
		var direction = Vector2.ZERO
		if Input.is_action_just_pressed("ui_right"):
			direction.x += 1
		elif Input.is_action_just_pressed("ui_left"):
			direction.x -= 1
		elif Input.is_action_just_pressed("ui_up"):
			direction.y -= 1
		elif Input.is_action_just_pressed("ui_down"):
			direction.y += 1

		if direction != Vector2.ZERO:
			var current_position = position
			# 🔍 Check if moving in that direction would collide
			var collision = move_and_collide(direction * step_size)
			if collision == null:
				target_position = position + direction * step_size
				is_moving = true
			else:
				target_position = current_position

	if is_moving:
		# 🧩 Smoothly move toward target
		position = position.move_toward(target_position, step_size / move_time * delta)
		if position == target_position:
			is_moving = false
