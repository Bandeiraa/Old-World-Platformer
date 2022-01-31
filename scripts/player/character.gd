extends KinematicBody2D
class_name Player

onready var stats: Node = get_node("Stats")
onready var sprite: Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")

func _physics_process(delta: float) -> void:
	move()
	stats.velocity.y += delta * stats.fall_speed
	stats.velocity = move_and_slide(stats.velocity, Vector2.UP)
	jump()
	animate()
	
	
func move() -> void:
	var input: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	stats.velocity.x = stats.speed * input
	
	
func jump() -> void:
	if is_on_floor():
		stats.jump_count = 0
		
	if Input.is_action_just_pressed("jump") and stats.jump_count < 2:
		stats.velocity.y = stats.jump_speed
		stats.jump_count += 1
		stats.landing = true
		
		
func animate() -> void:
	verify_direction()
	if stats.velocity.y != 0:
		jump_animation()
	elif stats.landing:
		animation.play("landing")
	elif not stats.landing:
		move_animation()
		
		
func verify_direction() -> void:
	if stats.velocity.x > 0:
		sprite.flip_h = false
	elif stats.velocity.x < 0:
		sprite.flip_h = true
		
		
func jump_animation() -> void:
	if stats.velocity.y > 0:
		animation.play("fall")
	elif stats.velocity.y < 0:
		animation.play("jump")
		
		
func move_animation() -> void:
	if stats.velocity.x != 0:
		animation.play("walk")
	else:
		animation.play("idle")
		
		
func on_animation_finished(anim_name: String) -> void:
	match anim_name:
		"landing":
			stats.landing = false
