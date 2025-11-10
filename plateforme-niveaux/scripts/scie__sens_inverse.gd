extends Area2D

@export var distance: float = 128.0         # 4 cases de 32px (4 * 32) : Distance de déplacement vertical.
@export var speed: float = 0.5              # Vitesse du mouvement vertical.
@export var rotation_speed: float = 180.0   # Vitesse de rotation (degrés par seconde).

var start_y: float

func _ready():
	start_y = position.y   # Sauvegarde la position de départ en Y.
	connect("body_entered", Callable(self, "_on_body_entered"))  # Détecte le contact avec le joueur.

func _process(delta):
	# Fait tourner la scie (Rotation).
	rotation_degrees += rotation_speed * delta
	# Inversion de phase PI = sens inverse.
	position.y = start_y + sin(Time.get_ticks_msec() / 500.0 * speed + PI) * distance

func _on_body_entered(body):
	# Si le joueur touche la scie, il meurt.
	if body.name == "Joueur":
		body.die()  # Appelle la fonction die() du joueur.
