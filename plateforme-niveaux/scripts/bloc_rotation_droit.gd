extends Node2D

@export var rotation_speed: float = 2.0  # Vitesse de rotation.
@export var delay_start: float = 0.6     # Temps avant le démarrage (secondes).

var timer: float = 0.0      # Compteur de temps.
var started: bool = false   # Indique si la rotation a commencé.

func _process(delta):
	if not started:
		# Compte le temps jusqu'au début de la rotation.
		timer += delta
		if timer >= delay_start:
			started = true
	else:
		# Applique la rotation une fois le délai écoulé.
		rotation += rotation_speed * delta
