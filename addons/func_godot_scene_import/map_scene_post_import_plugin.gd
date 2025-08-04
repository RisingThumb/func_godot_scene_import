@tool
class_name MapScenePostImportPlugin
extends EditorScenePostImportPlugin

const DEFAULT_SETTINGS := preload("res://addons/func_godot/func_godot_default_map_settings.tres")

func _get_import_options(path: String) -> void:
	if !path.ends_with(".map"):
		return

	# add_import_option("map_settings", load("res://addons/func_godot/func_godot_default_map_settings.tres"))
	add_import_option_advanced(TYPE_OBJECT, "map_settings", DEFAULT_SETTINGS, PROPERTY_HINT_RESOURCE_TYPE, "FuncGodotMapSettings")
