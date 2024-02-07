extends RigidBody2D

@export var speed = 400
var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


func _process(delta):
	var velocity = Vector2.ZERO

	if position.x >= 0 and position.x <= screen_size.x and position.y <= 0:
		velocity.y += 1
	elif position.x >= 0 and position.x <= screen_size.x and position.y >= screen_size.y:
		velocity.y -= 1
	elif position.y >= 0 and position.y <= screen_size.y and position.x <= 0:
		velocity.x += 1
	elif position.y >= 0  and position.y <= screen_size.y and position.x >= screen_size.x:
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
