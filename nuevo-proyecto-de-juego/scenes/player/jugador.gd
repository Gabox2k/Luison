extends CharacterBody3D

# Velocidad del jugador
@export var velocidad := 6.0

func _physics_process(_delta):
	# Hacer que siempre avance hacia adelante
	velocity.z = -velocidad
	# Mover al personaje
	move_and_slide()
