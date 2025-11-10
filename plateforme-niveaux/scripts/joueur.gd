class_name Joueur
extends CharacterBody2D

# CONSTANTES DE DÉPLACEMENT.
const SPEED = 300.0            # Vitesse de déplacement horizontal.
const JUMP_VELOCITY = -500.0   # Force de saut.
const glisser_mur_mod = 0.15   # Modificateur de gravité pour glisser sur les murs.

@export var etat_courant = Etat.REPOS

# ÉTATS DU JOUEUR.
enum Etat {
	REPOS,
	PROMENER,
	SAUT,
	GLISSE_MUR
}

# LA PHYSIQUE DU JOUEUR.
func _physics_process(delta: float) -> void:
	
	# GESTION DE LA GRAVITÉ ET DES ANIMATIONS SELON L'ÉTAT.
	if not is_on_floor():
		if is_on_wall() and velocity.y > 0:    
			etat_courant = Etat.GLISSE_MUR
			velocity += get_gravity() * delta * glisser_mur_mod
			$AnimatedSprite2D.play("glisser_mur")
			if Input.is_action_just_pressed("sauter"):    
				velocity.y = JUMP_VELOCITY
				if has_node("JumpSfx"):
					$JumpSfx.play()
				velocity.x = move_toward(velocity.x, 0, sign(velocity.x) * SPEED)
		else:
			etat_courant = Etat.SAUT
			velocity += get_gravity() * delta
			$AnimatedSprite2D.play("sauter")
	else:
		if velocity.x == 0:
			etat_courant = Etat.REPOS
			$AnimatedSprite2D.play("repos")
		else:
			etat_courant = Etat.PROMENER
			$AnimatedSprite2D.play("promener")
	
	# Retourne le sprite selon la direction.
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	# Saut depuis le sol (Poignée de saut).
	if Input.is_action_just_pressed("sauter") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if has_node("JumpSfx"):
			$JumpSfx.play()

	# Récupère la direction de déplacement et gère la décélération.
	var direction := Input.get_axis("promener_gauche", "promener_droite")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

# Applique la physique.
	move_and_slide()

# MORT DU JOUEUR
func die():
	set_physics_process(false)         # Arrête la physique.
	if has_node("AnimatedSprite2D"):
		$AnimatedSprite2D.play("mort") # Animation de mort.
	await get_tree().create_timer(1.0).timeout
	if get_tree() and get_tree().current_scene:
		get_tree().reload_current_scene()  # Recharge la scène.
