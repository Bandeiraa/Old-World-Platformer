extends ParallaxBackground
class_name Background

export(Array, NodePath) var layers
export(Array, float) var layers_speed

func _physics_process(delta: float) -> void:
	for i in layers.size():
		var current_layer: ParallaxLayer = get_node(layers[i])
		current_layer.motion_offset.x -= delta * layers_speed[i]
