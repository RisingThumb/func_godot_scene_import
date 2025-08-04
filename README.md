# func_godot_scene_import

Important: This depends on func_godot being present! This plugin does nothing useful on its own!

This plugin allows you to import .map files as standalone scenes that can then be instantiated within Godot. This has a few useful applications.

Firstly, if the .map file has any changes made to it, it will be reimported automatically so you don't have to rebuild all instances of it making it more usable for props or other small reusable bits of detail. This does have a cost of rebuilding the map each time a change is made to it which can sometimes not be desirable.

Secondly, if you were using runtime map generation for procedural generation of dungeons, you would be going through a comparatively expensive build process to build map geometry and collisions. This allows you to just add a scene instead. Then after you've added all your scenes you could have a marker entity to add random elements throughout the dungeon after the layout is setup.

Thirdly, you get to use map files as scenes which in my opinion fits better into how Godot is used. It's akin to using gltf rather than obj for models.

To use this addon, you add it to your res://addons folder, go to Project>Project Settings>Plugins and enable the plugin. Then when you click on a .map file you will now have an additional option under the imports to import it as a scene. When you import it as a scene you also have the option to set what map settings it uses.

As a minor compatibility note, this plugin works fine with func_godot_lightpass. The way I use it, is I add the scene to my scene tree, enable edit as children for the scene, add any func_godot_lightpass entities, export all the func_godot_lightpass_entities, and then(usually after you save the scene), Godot detects the changes to the .map file and updates them.

If you find any bugs, report them on the Github issue tracker.
