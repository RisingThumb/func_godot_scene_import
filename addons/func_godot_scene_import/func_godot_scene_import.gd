@tool
class_name FuncGodotSceneImport
extends EditorPlugin

var map_scene_import_plugin: MapSceneImportPlugin = null
var map_scene_post_import_plugin: MapScenePostImportPlugin = null

func _enter_tree() -> void:
	map_scene_import_plugin = MapSceneImportPlugin.new()
	map_scene_post_import_plugin = MapScenePostImportPlugin.new()
	add_scene_format_importer_plugin(map_scene_import_plugin)
	add_scene_post_import_plugin(map_scene_post_import_plugin)


func _exit_tree() -> void:
	remove_scene_format_importer_plugin(map_scene_import_plugin)
	remove_scene_post_import_plugin(map_scene_post_import_plugin)
	map_scene_import_plugin = null
	map_scene_post_import_plugin = null
