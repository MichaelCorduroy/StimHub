extends RigidBody3D

@export var counter = 0

@onready var audio = self.get_parent().get_child(0)

var clank = preload("res://clank.mp3")

func _on_body_entered(body):
	# Check if the colliding body is a StaticBody3D (or any other type you want)
	if body.is_class("StaticBody3D"):
		self.counter += 1
		audio.play()
		print("bounced: " + str(self.counter))

		# Create a duplicate of the current RigidBody3D with a unique name
		var new_duplicate = duplicate()  # Renamed variable to 'new_duplicate'
		new_duplicate.name = "duplicate_" + str(self.counter)

		# Set the duplicate's position to the collision point
		new_duplicate.position = Vector3(0, 4, 0)

		get_parent().add_child(new_duplicate)
