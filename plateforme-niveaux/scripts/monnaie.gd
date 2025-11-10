extends Area2D

func _ready() -> void:
	# Connecte le signal lorsqu'un corps entre dans la zone (collision).
	body_entered.connect(monnaie_touchee)
	
func monnaie_touchee(body):
	# Vérifie si le corps touché est le joueur.
	if body is Joueur:
		Main.augmenter_monnaies()     # Incrémente le nombre de monnaies dans le HUD.
		call_deferred("queue_free")   # Supprime la monnaie après collecte.
