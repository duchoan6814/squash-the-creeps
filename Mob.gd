extends CharacterBody3D

# Minimum speed of the mob in meters per second.
@export var min_speed = 10
# Maximum speed of the mob in meters per second.
@export var max_speed = 18

func _physics_process(delta):
	move_and_slide()

# This function will call in main screen
func initialize(start_postion, player_postion):
	# khở tạo mob ở vị trí start_postion và hướng mob về phía Player
	look_at_from_position(start_postion, player_postion, Vector3.UP)
	
	# hướng mob đi một hướng random từ -90 đến 90 độ để mob không đi thẳng trực tiếp về phía Player
	rotate_y(randf_range(deg_to_rad(-90), deg_to_rad(90)))

	# random speed
	var random_speed = randi_range(min_speed, max_speed)
	
	# tính toán vận tốc tiến về phía trước với tốc độ vừa được tạo ra
	velocity = Vector3.FORWARD * random_speed
	
	# We then rotate the velocity vector based on the mob's Y rotation
	# in order to move in the direction the mob is looking.
	velocity = velocity.rotated(Vector3.UP, rotation.y)


func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
