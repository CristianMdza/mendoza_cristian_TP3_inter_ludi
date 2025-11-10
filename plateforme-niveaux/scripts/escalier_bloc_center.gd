extends Area2D

# Référence au joueur lorsqu'il entre dans la zone.
var joueur_dans_zone = null

func _ready():
	# Connexion des signaux d'entrée et de sortie de zone.
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	# Si le corps entrant est le joueur, on le référence.
	if body.is_in_group("joueur"):
		joueur_dans_zone = body

func _on_body_exited(body):
	# Si le joueur sort de la zone, on supprime la référence.
	if body.is_in_group("joueur"):
		joueur_dans_zone = null

func _physics_process(_delta):
	if joueur_dans_zone:
		# Déplace le joueur verticalement selon l'entrée.
		if Input.is_action_pressed("monter"):
			joueur_dans_zone.velocity.y = -150  # vitesse de montée.
		elif Input.is_action_pressed("descendre"):
			joueur_dans_zone.velocity.y = 150   # vitesse de descente.
		else:
			# S'il ne fait rien, on bloque le mouvement vertical.
			joueur_dans_zone.velocity.y = 0
