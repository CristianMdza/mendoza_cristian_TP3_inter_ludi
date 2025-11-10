extends Node2D

@export var angle_max: float = 45.0        # L'angle maximum de rotation (en degrés).
@export var vitesse: float = 2.0           # Vitesse de rotation.
var direction: int = 1                     # Sens de rotation : 1 = sens horaire, -1 = sens antihoraire.
var angle_actuel: float = 0.0              # Angle actuel de la plate-forme (en degrés).

func _process(delta: float) -> void:
	# Incrémente l'angle selon la direction et la vitesse.
	angle_actuel += direction * vitesse * delta * 60.0
	
	# Si l'angle dépasse les limites, inverse la direction.
	if angle_actuel > angle_max:
		angle_actuel = angle_max
		direction = -1
	elif angle_actuel < -angle_max:
		angle_actuel = -angle_max
		direction = 1
	
	# Applique la rotation (en degrés).
	rotation_degrees = angle_actuel
