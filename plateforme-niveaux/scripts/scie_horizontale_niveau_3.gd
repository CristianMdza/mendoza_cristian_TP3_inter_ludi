extends Area2D

@export var distance: float = 64.0         # 2 cases de 32px (2 * 32) : Distance de déplacement horizontal.
@export var speed: float = 0.5             # Vitesse du mouvement horizonal.
@export var rotation_speed: float = 180.0  # Vitesse de rotation (degrés par seconde).

var direction: int = 1
var start_x: float

func _ready():
	start_x = position.x                # Sauvegarde la position de départ en X.
	$CollisionShape2D.disabled = false  # Active la collision.
	connect("body_entered", Callable(self, "_on_body_entered"))  # Détecte le contact avec le joueur.

func _process(delta):
	# Fait tourner la scie (Rotation).
	rotation_degrees += rotation_speed * delta

	# Mouvement horizontal alternant.
	position.x = start_x + sin(Time.get_ticks_msec() / 500.0 * speed) * distance

func _on_body_entered(body):
	# Si le joueur touche la scie, il meurt.
	if body.name == "Joueur":
		body.die()  # Appelle la fonction die() du joueur.
