# Debug Menu add-on for Godot 4.x

![Screenshot](https://raw.githubusercontent.com/Calinou/media/master/godot-debug-menu-demo/screenshot.png)

**Displays performance information in a Godot project during gameplay.**
Can be used when running from the editor and in exported projects.
Inspired by id Tech 6/7's performance overlay.

This repository only contains the add-on. See
[godot-extended-libraries/godot-debug-menu-demo](https://github.com/godot-extended-libraries/godot-debug-menu-demo)
for the demonstration project.

## Features

- Features compact and full display modes, with the compact mode only displaying
  FPS, frametime and framerate cap.
- Displays FPS, frametime, CPU time and GPU time graphs with a summary of the
  best/worst/average frametimes over recently drawn frames.
- Displays hardware information, including graphics driver version.
- Displays software information, including project version (if specified in the
  `application/config/version` custom project setting) and graphics settings.
- Works with the Forward+, Mobile and Compatibility rendering methods.
- Works with 2D and 3D projects.
- Works when running the project from the editor, but also in exported projects
  (debug and release).

## Why use this debug menu?

- Compared to the Godot editor's Profiler, Monitors and Visual Profiler bottom
  panels, you can look at an in-game debug menu while the project is running,
  even in fullscreen if you only have a single monitor.
    - Rendering performance is highly dependent on window size, so resizing the
      window is not advised for reliable performance measurements in real world
      scenarios.
- This debug menu accurately displays graphs and best/worst frametime metrics
  over a period of the last 150 rendered frames, which is useful to diagnose
  stuttering issues. The Monitor bottom panel is only updated once a second and
  doesn't feature a 1% low FPS metric, which makes tracking stuttering
  difficult when relying solely on the monitors.
- This debug menu can be used in exported projects to reliably test performance
  without any editor interference. This includes testing on mobile and Web
  platforms, which tend to be more difficult to set up for profiling within
  Godot (if it's even possible).
- This debug menu can be used in exported projects for tech support purposes.
  For example, in a bug report, you could ask a player to upload screenshots
  with the debug menu visible to troubleshoot performance issues.

External tools such as RTSS or [MangoHud](https://github.com/flightlessmango/MangoHud)
provide some insight on how well a project actually runs. However, they lack
information on engine-specific things such as per-frame CPU/GPU time and
graphics settings.

## How to read values in the debug menu

To determine whether values for **Total**, **CPU** and **GPU** displayed in the
debug menu are good or bad, you need to set yourself a target frametime first.
Unlike FPS (frames per second), lower frametimes are *better*.

The frametime is determined by the formula `1000.0 / FPS` where `FPS` is your
target FPS. For example, if you aim to have at least 60 FPS at all times on your
current hardware, you should ensure that **Total** never exceeds 16.66 mspf
(milliseconds per frame). At 30 FPS, this target frametime is 33.33 mspf, and at
120 FPS, it's 8.33 mspf.

When looking at `Avg` (average) metrics, it's recommended to keep *at least* 25%
of headroom to ensure that more demanding situations in the game can match the
target frametime. This also allows the hardware to cool better and have better
battery life if using a framerate cap. This means that if you target 60 FPS,
your average FPS should be at least 75, which is a frametime of 13.33 mspf or
lower.

If the FPS dips below the target due to the frame time being too high, this
could be due to a bottleneck in one of 3 areas:

- **GPU rendering:** This is denoted by the GPU time going close to the target
  frametime (not necessarily above, as the total frametime is also determined by
  the CPU time and scripting). This is usually caused by stressing the GPU too
  much with advanced shaders, high polygon counts or antialiasing, or having a
  weak GPU compared to the CPU.
- **CPU rendering:** This is denoted by the CPU time going close to the target
  (not necessarily above, as the total frametime is also determined by the GPU
  time and scripting). This is usually caused by having too many draw calls in
  the scene, or having a weak CPU compared to the GPU.
- **CPU other:** This is **not** denoted by the CPU or GPU time metrics, but by
  the Total time metric (which is just a different way to display FPS). This is
  usually caused by scripting, physics simulation or navigation computations
  taking too much time in a given frame.

The metrics marked as `Worst` are also important, as these denote the time taken
to render the slowest frame in the currently displayed graph (the graph shows
the last 150 rendered frames). You want to make sure this metric stays below
your target frametime as much as possible.

You can find detailed guidance on optimizing a project's performance in the
[documentation](https://docs.godotengine.org/en/stable/tutorials/performance/index.html).

## Installation

### Using the Asset Library

- Open the Godot editor.
- Navigate to the **AssetLib** tab at the top of the editor and search for
  "debug menu".
- Install the
  [*Debug Menu*](https://godotengine.org/asset-library/asset/1902)
  plugin. Keep all files checked during installation.
- In the editor, open **Project > Project Settings**, go to **Plugins**
  and enable the **Debug Menu** plugin.

### Manual installation

Manual installation lets you use pre-release versions of this add-on by
following its `master` branch.

- Clone this Git repository:

```bash
git clone https://github.com/godot-extended-libraries/godot-debug-menu.git
```

Alternatively, you can
[download a ZIP archive](https://github.com/godot-extended-libraries/godot-debug-menu/archive/master.zip)
if you do not have Git installed.

- Move the `addons/` folder to your project folder.
- In the editor, open **Project > Project Settings**, go to **Plugins**
  and enable the **Debug Menu** plugin.

## Usage

Press <kbd>F3</kbd> while the project is running. This cycles between no debug
menu, a compact debug menu (only FPS and frametime visible) and a full debug
menu.

The key to cycle the debug menu is set to <kbd>F3</kbd> by default. This can be
changed by setting the `cycle_debug_menu` action in the Input Map to a different
key. This action is not created by the plugin in the editor, so you will have to
create it in the Project Settings if you wish to override the key.

To toggle the debug menu from code, use:

- `DebugMenu.style = DebugMenu.Style.NONE` to hide the debug menu.
- `DebugMenu.style = DebugMenu.Style.VISIBLE_COMPACT` to show the compact debug menu.
- `DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED` to show the detailed debug menu.

## License

Copyright © 2023-present Hugo Locurcio and contributors

Unless otherwise specified, files in this repository are licensed under the
MIT license. See [LICENSE.md](LICENSE.md) for more information.
