extends Source
class_name Quarry

func _init():
	source_name = "quarry"
	product = Stone
	produced_items_per_request = 1
	cooldown_in_sec = 2
	interacting_component = null
