extends Area2D

@export var scene = "LoseScreen"
@onready var timer: Timer = $Timer


func _on_killzone_body_entered(body):
	if body.is_in_group("player"):
		timer.start()
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file(str("res://scenes/" + scene + ".tscn"))
