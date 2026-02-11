extends CharacterBody3D

#configuracion

@export var lane_distance := 2.0
@export var forward_speed := 10.0
@export var lane_change_speed := 10.

#carril actual
var current_lane := 1

func _physics_process(delta):
	#movimineto hacia adelante
	velocity.z = forward_speed
	
	#cambiar carril con teclas
	if Input.is_action_pressed("ui_left"):
		current_lane -= 1
		current_lane = clamp(current_lane, 0, 2) 
	
	if Input.is_action_pressed("ui_right"):
		current_lane += 1
		current_lane = clamp(current_lane, 0, 2)
		
	#Calcular posicion objetivo en x
	var target_x = (current_lane - 1) * lane_distance
	
	#Movimimiento suave 
	position.x = lerp(position.x, target_x, lane_change_speed * delta) 
	
	move_and_slide()
