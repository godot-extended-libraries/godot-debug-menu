@tool
extends EditorPlugin

func _enter_tree() -> void:
	if not ProjectSettings.has_setting("autoload/DebugMenu"):
		add_autoload_singleton("DebugMenu", "res://addons/debug_menu/debug_menu.tscn")

	if not ProjectSettings.has_setting("application/config/version") or ProjectSettings.get_setting("application/config/version") == "":
		ProjectSettings.set_setting("application/config/version", "1.0.0")
		print('Debug Menu: Setting "application/config/version" was missing or empty and has been set to "1.0.0".')

	ProjectSettings.add_property_info({
		name = "application/config/version",
		type = TYPE_STRING,
	})

	ProjectSettings.save()
	
	
	# Add new Project Setting for font size
	if not ProjectSettings.has_setting("DebugMenu/font_size"):
		ProjectSettings.set_setting("DebugMenu/font_size", 2)
	var property_info = {
		"name": "DebugMenu/font_size",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": "3px font size,6px font size,12px font size (default),18px font size,24px font size,30px font size"
	}
	ProjectSettings.add_property_info(property_info)
	ProjectSettings.set_initial_value("DebugMenu/font_size", 2) # 2 = 12px font size in enum
	ProjectSettings.save()

func _exit_tree() -> void:
	remove_autoload_singleton("DebugMenu")
	# Don't remove the project setting's value and input map action,
	# as the plugin may be re-enabled in the future.
