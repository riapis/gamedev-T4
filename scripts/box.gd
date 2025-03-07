extends RigidBody2D

var push = false
var direction = 0
const SPEED = 500

func _ready():
	gravity_scale = 2  # Aktifkan gravitasi

func _physics_process(delta: float) -> void:
	if push:
		linear_velocity.x = direction * SPEED  # Gunakan velocity untuk dorongan horizontal
	else:
		linear_velocity.x = 0  # Hentikan pergerakan saat tidak didorong

func _on_arealeft_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		direction = 1
		push = true
		print("EXITED:", body.name)

func _on_arearight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		direction = -1
		push = true

func _on_arealeft_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		push = false
		print("ENTERED:", body.name)

func _on_arearight_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		push = false
