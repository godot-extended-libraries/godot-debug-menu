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


func _exit_tree() -> void:
	remove_autoload_singleton("DebugMenu")
	# Don't remove the project setting's value and input map action,
	# as the plugin may be re-enabled in the future.
