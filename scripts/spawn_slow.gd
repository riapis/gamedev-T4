extends Node2D

@export var obstacle : PackedScene
@onready var timer: Timer = $Timer

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + randf_range(3454, 3822)
	spawn_pos.y = -1360

	spawned.global_position = spawn_pos
	
	await get_tree().create_timer(5).timeout
	spawned.queue_free()

func repeat():
	spawn()
	await get_tree().create_timer(5).timeout
	repeat()
