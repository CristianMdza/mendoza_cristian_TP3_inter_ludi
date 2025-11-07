extends Node2D

func _ready():
	# Joue automatiquement l’animation "flamme" dès le début
	$AnimatedSprite2D.play("flamme")
