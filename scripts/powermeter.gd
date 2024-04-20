extends Control

var max_power = 1.0  # Adjust for desired power range
var current_power = 0.0

func _process(delta):
	# Simulate power increase over time (optional)
	current_power += delta  # Adjust delta for desired power accumulation speed
	current_power = clamp(current_power, 0.0, max_power)

	# Update slider value based on current power
	self.set("value", current_power)  # Using set method

func reset():
	current_power = 0.0  # Reset power meter on button press/release

func get_power():
	return current_power




