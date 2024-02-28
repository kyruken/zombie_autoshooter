extends Node

@export var health = 3

func take_damage(damage_value):
	health -= damage_value
	if health <= 0:
		die()

func die():
	get_parent().queue_free()
