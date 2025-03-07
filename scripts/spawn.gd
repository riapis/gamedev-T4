extends Node2D

@export var obstacle : PackedScene
@onready var timer: Timer = $Timer

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + randf_range(1797, 2497)
	spawn_pos.y = -760

	spawned.global_position = spawn_pos
	
	await get_tree().create_timer(3).timeout
	spawned.queue_free()

func repeat():
	spawn()
	await get_tree().create_timer(1.3).timeout
	repeat()
