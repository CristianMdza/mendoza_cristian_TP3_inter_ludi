extends Node2D

func _ready():
	# Joue automatiquement l’animation "face_sourire_colline" dès le début
	$AnimatedSprite2D.play("face_sourire_colline")
