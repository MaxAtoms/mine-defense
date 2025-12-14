extends Area2D

var speed: float
var damage: int
var damage_range: float = 100
var direction: Vector2

func _ready() -> void:
	global_rotation = direction.angle() - PI / 2

func _physics_process(delta: float) -> void:
	position += direction.normalized() * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		for target in get_tree().get_nodes_in_group("enemy"):
			var distanceSquared = global_position.distance_squared_to(target.global_position)
			if distanceSquared <= damage_range * damage_range:
				var distance = global_position.distance_to(target.global_position)
				target.damagable.damage(damage * distance / damage_range)
		body.get_node("Damagable").damage(damage)
		
		#animation
		_death()
		#queue_free()

func _death():
	#ToDO: doesnt work
	$Sprite2D.visible = false
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation = "default"


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
