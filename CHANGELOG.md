# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.0.1...HEAD
[1.0.1]: https://github.com/godot-extended-libraries/godot-debug-menu/compare/v1.0.0...v1.0.1
