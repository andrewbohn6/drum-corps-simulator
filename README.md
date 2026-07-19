# Drum Corps Simulator

A long-term drum corps management game built with Godot 4 and GDScript.

## Version 0.1.0

This foundation release includes:

- A polished main menu
- Corps creation with identity and color selection
- A placeholder management dashboard
- A shared UI theme and maintainable scene-based architecture

Simulation systems are intentionally out of scope for this release.

## Running the project

1. Install Godot 4.3 or newer.
2. Import `project.godot` from the Godot Project Manager.
3. Run the project with **F6** or **F5**.

## Project structure

```text
assets/          Project artwork and icons
scenes/          Godot scenes grouped by feature
scripts/core/    Cross-scene application state
scripts/ui/      Scene-specific presentation logic
themes/          Shared UI theme resources
```

