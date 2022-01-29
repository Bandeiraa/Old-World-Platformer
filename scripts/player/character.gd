extends KinematicBody2D
class_name Player

onready var stats: Node = get_node("Stats")
onready var animation: AnimationPlayer = get_node("Animation")

func _physics_process(delta: float) -> void:
	move()
	stats.velocity = move_and_slide(stats.velocity)
	animate()
	
	
func move() -> void:
	var input: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	stats.velocity.x = stats.speed * input
	
	
func animate() -> void:
	if stats.velocity.x != 0:
		animation.play("walk")
	else:
		animation.play("idle")
