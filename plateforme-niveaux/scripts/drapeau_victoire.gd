extends Node2D

func _ready():
	# Joue automatiquement l’animation "mouvement_drapeau" dès le début.
	$AnimatedSprite2D.play("mouvement_drapeau")
