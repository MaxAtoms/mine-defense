extends Node2D

@export var max_health: float = 100

signal on_damage
signal on_death

var health: float = max_health

func damage(amount: float) -> void:
	if health <= 0:
		return
	health = max(health - amount, 0)
	on_damage.emit(amount)
	if health <= 0:
		on_death.emit()

func heal(amount: float) -> void:
	health = min(health + amount, max_health)
