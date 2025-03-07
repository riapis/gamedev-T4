extends StaticBody2D


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

var sceneName = "WinScreen"


func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		sprite.play("move")
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
