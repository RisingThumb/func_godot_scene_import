@tool
class_name MapSceneImportPlugin
extends EditorSceneFormatImporter

func _get_extensions( ) -> PackedStringArray:
	return PackedStringArray(['map'])

func _import_scene(path: String, flags: int, options: Dictionary) -> Object:
	var tree = SceneTree.new()

	var map_node := FuncGodotMap.new()
	map_node.local_map_file = path

	if options.has("map_settings") and options["map_settings"] is FuncGodotMapSettings:
		map_node.map_settings = options["map_settings"]

	tree.root.add_child(map_node)

	map_node.build()

	tree.root.remove_child(map_node)
	tree.free()

	map_node.name = path.get_file().get_basename().to_pascal_case()
	return map_node
