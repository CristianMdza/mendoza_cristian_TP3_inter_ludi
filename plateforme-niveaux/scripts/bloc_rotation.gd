extends Node2D

@export var base_speed: float = 2.0    # Vitesse de rotation de base.
@export var amplitude: float = 1.5     # Intensité des variations de vitesse.
@export var frequency: float = 1.0     # Fréquence des oscillations.
@export var reverse_delay: float = 3.0 # Après combien de secondes la rotation s’inverse.

var direction: int = 1   # Sens de rotation : 1 = horaire, -1 = antihoraire.
var timer: float = 0.0   # Compteur de temps pour inversion du sens.

func _process(delta):
	timer += delta     # Compte le temps écoulé.

	# Inverse automatiquement le sesn de rotation après un certain temps.
	if timer >= reverse_delay:
		direction *= -1
		timer = 0.0
		
	# Vitesse dynamique avec oscillation sinus (effet "respiration")
	var dynamic_speed = base_speed + sin(Time.get_ticks_msec() / 500.0) * amplitude
	
	# Applique la rotation en fonction du sens et de la vitesse
	rotation += direction * dynamic_speed * delta
