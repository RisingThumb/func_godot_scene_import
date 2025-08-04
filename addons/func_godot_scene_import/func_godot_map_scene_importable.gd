@tool
class_name FuncGodotMapSceneImportable
extends FuncGodotMap

func set_owner_editor(node: Node) -> void:
	node.set_owner(self);

func run_build_steps(post_attach : bool = false) -> void:
	var target_array : Array = post_attach_steps if post_attach else build_steps

	while target_array.size() > 0:
		var build_step : Array = target_array.pop_front()
		emit_signal("build_progress", build_step[0], float(build_step_index + 1) / float(build_step_count))

		#var scene_tree : SceneTree = get_tree()
		#if scene_tree and not block_until_complete:
			#await get_tree().create_timer(YIELD_DURATION).timeout

		var result : Variant = run_build_step(build_step[0])
		var target : String = build_step[1]
		if target != "":
			set(target, result)

		build_step_index += 1

		#if scene_tree and not block_until_complete:
			#await get_tree().create_timer(YIELD_DURATION).timeout

	if post_attach:
		_build_complete()
	else:
		start_profile('add_children')
		add_children()

func add_children() -> void:
	while true:
		for i in range(0, set_owner_batch_size):
			if add_child_array.size() > 0:
				var data: Dictionary = add_child_array.pop_front()
				if data:
					add_child_editor(data['parent'], data['node'], data['below'])
					if data['relative']:
						if (data['node'] is Node3D and data['parent'] is Node3D) or (data['node'] is Node2D and data['parent'] is Node2D):
							data['node'].position -= data['parent'].position
				continue
			add_children_complete()
			return

		#var scene_tree: SceneTree = get_tree()
		#if scene_tree and not block_until_complete:
			#await get_tree().create_timer(YIELD_DURATION).timeout

func set_owners() -> void:
	while true:
		for i in range(0, set_owner_batch_size):
			var node: Node = set_owner_array.pop_front()
			if node:
				set_owner_editor(node)
			else:
				set_owners_complete()
				return

		#var scene_tree: SceneTree = get_tree()
		#if scene_tree and not block_until_complete:
			#await get_tree().create_timer(YIELD_DURATION).timeout
