# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.2] - 2023-08-23

### Fixed

- [Fix error when running a scene without an Environment resource.](https://github.com/godot-extended-libraries/godot-debug-menu/pull/14)
- Fix error spam when the add-on starts due to the thread safety checks added in Godot 4.1.

## [1.1.1] - 2023-06-15

### Fixed

- Fix debug menu appearing behind 2D elements in the scene, or appearing offset
  when using a Camera2D.
  - This required changing the node structure by making them children of a
    CanvasLayer, so you may have to edit scripts if you're modifying the debug
    menu nodes' from a script.

## [1.1.0] - 2023-05-26

### Added

- The keyboard shortcut used to toggle the debug menu can now be overridden by
  adding a `cycle_debug_menu` input action to the input map.

### Fixed

- The 3D rendering resolution is now correctly calculated when using the
  `canvas_items` stretch mode.
- The debug menu no longer blocks mouse input when visible.

## [1.0.1] - 2023-05-20

### Fixed

- [Fixed project startup being delayed by the singleton initialization.](https://github.com/godot-extended-libraries/godot-debug-menu/pull/1)

## 1.0.0 - 2023-05-19

- Initial versioned release.

[Unreleased]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.1.2...HEAD
[1.1.2]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.0.0...v1.0.1
