extends Area2D

@export var groupe_cle:String  # Identifiant du groupe de la clé.

func _on_body_entered(_body: Node2D) -> void:
	# Appelle la fonction principale pour débloquer la clé.
	Main.debloquer_cle(self)
	# Désactive la collision pour éviter les interactions supplémentaires.
	$CollisionShape2D.set_deferred("disabled", true)
	# Rend la clé invisible (feedback visuel).
	$KeyBlue.visible = false
	# Joue le son de collecte.
	%CleSfx.play()
	await %CleSfx.finished  # Attend la fin du son.
	# Supprime la clé de la scène après collecte.
	queue_free()
