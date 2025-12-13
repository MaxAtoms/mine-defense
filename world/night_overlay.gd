extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var day_length := 20.0
@export var night_color := Color(0.05, 0.05, 0.35, 0.55)
var curve_strength := 5.0 # higher = more square

var time := 0.0
var is_night := false

func _process(delta):
	
	#TODO: wenn monster dann nicht tag werden lassen
	
	time += delta
	var cycle := (time / day_length) * TAU

	
	var raw := (sin(cycle - PI / 2) + 1) / 2
	var night_strength := pow(raw, curve_strength)

	color.a = night_color.a * night_strength
	color.r = night_color.r
	color.g = night_color.g
	color.b = night_color.b

	# Day / night state
	is_night = night_strength > 0.5
	
	if label != null:
		label.text = "a"
	
