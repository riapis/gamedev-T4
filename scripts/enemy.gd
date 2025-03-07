extends Node2D

const SPEED = 200
var direction = -1

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycastr = $RayCastRight
@onready var raycastl = $RayCastLeft
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if raycastr.is_colliding():
		direction = -1
		sprite.flip_h = false
	if raycastl.is_colliding():
		direction = 1
		sprite.flip_h = true
		
	position.x += direction * SPEED * delta
