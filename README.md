### Fari Hafizh Ramadhan - 2206083691

# Tutorial 4

1. Dalam pengimplementasian level baru ini, saya memulai dari membangun dunia dengan menggunakan `TileMap`, untuk platform saya menggunakan `AnimatableBody2D` agar bisa diberi animasi bergerak

2. Untuk karakternya menggunakan script basic movement dengan tambahan climbing ladder, berikut script CharacterBody2D:
```
extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0
var status_onladder = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ladderray: RayCast2D = $RayCast2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle climb & movement
	var onladder = ladderray.get_collider()
	
	if onladder:
		climb(delta)
	else:
		movement(delta)
	
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	
	move_and_slide()
	
	animation(direction_x, direction_y)	

func movement(delta):
	status_onladder = false
	
	var direction := Input.get_axis("left", "right")
	
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	# Move left or right
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func climb(delta):
	status_onladder = true
	
	var direction_up := Vector2.ZERO
	
	direction_up.x = Input.get_axis("left", "right")
	direction_up.y = Input.get_axis("up", "down")
	
	if direction_up:
		velocity = direction_up * SPEED / 2
	else:
		velocity = Vector2.ZERO
	
	#if velocity:
		#sprite.play("climb")
	#else:
		#sprite.stop()
	

func animation(direction_x, direction_y):
	if status_onladder == true:
		if direction_y == 0 and direction_x == 0:
			sprite.play("climb_idle")
		else:
			sprite.play("climb")
	else:
		if is_on_floor():
			if direction_x == 0:
				sprite.play("idle")
			else:
				sprite.play("walk")
		else:
			if velocity.y < 0:
				sprite.play("jump")
			elif velocity.y > 0:
				sprite.play("hit")

```

Dalam pembuatan karakter saya juga memanfaatkan layer & mask untuk mengontrol Area2D yang hanya bisa dikenai oleh player

3. Enemy saya membuatnya dengan mengikuti tutorial dari youtube. Enemy akan berjalan ke kanan sampai menabrak tembok lalu berpindah arah jadi ke kiri dan seterusnya.

4. Spawner saya jadikan salah satu rintangan dengan range yang sudah saya tentukan

referensi:
https://www.youtube.com/watch?v=8F0jrZE-nEI&t=55s
https://www.youtube.com/watch?v=LOhfqjmasi0&t=3160s