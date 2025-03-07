extends Area2D

@export var sceneName: String = "WinScreen"


func _on_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
