extends Node2D

@export var rotation_speed: float = 2.0  # Vitesse de rotation en radians/sec.

func _process(delta):
	# Applique la rotation en fonction du temps écoulé.
	rotation += rotation_speed * delta
