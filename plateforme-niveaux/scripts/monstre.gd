extends Area2D

func _ready():
	$AnimatedSprite2D.play("ouvrir_cornes_monstre")  # Animation du monstre
	$CollisionShape2D.disabled = false
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Joueur":
		body.die()   
