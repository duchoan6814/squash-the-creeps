extends Node

@export var mob_sence: PackedScene


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_sence.instantiate()
	
	# Choose a random location on the SpawnPath.
	# We store the reference to the SpawnLocation node.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)
	
	add_child(mob)