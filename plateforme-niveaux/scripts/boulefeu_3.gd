extends Area2D

@export var distance: float = 224.0        # 7 cases de 32px (7 * 32) : Distance du mouvement vertical.
@export var speed: float = 1.0             # Vitesse du mouvement.
@export var rotation_speed: float = -270.0  # Vitesse de rotation (degrés/sec).
@export var phase_offset: float = 0.0      # Décalage pour les mouvements intercalés.

var start_y: float

func _ready():
	start_y = position.y
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta):
	# Rotation continue
	rotation_degrees += rotation_speed * delta
	
	# Mouvement vertical (sinusoïdal)
	var t = (Time.get_ticks_msec() / 500.0 * speed) + phase_offset
	position.y = start_y + sin(t) * distance

func _on_body_entered(body):
	if body.name == "Joueur":
		body.die()  # Tue le joueur
