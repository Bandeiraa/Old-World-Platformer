extends StaticBody2D

onready var collision: CollisionShape2D = get_node("Collision")

export(Vector2) var collision_size

func _ready() -> void:
	var rectangle_shape: RectangleShape2D = RectangleShape2D.new()
	rectangle_shape.set_extents(collision_size)
	collision.set_shape(rectangle_shape) 
