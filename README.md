# Drum Corps Simulator

A long-term drum corps management game built with Godot 4 and GDScript.

## Version 0.3.0 — Building the Staff

This release includes:

- A polished main menu
- Corps creation with identity and color selection
- Four distinct founding philosophies
- An organization approval and starting-profile flow
- A procedural market of varied instructional candidates
- Detailed staff profiles, attributes, personalities, and derived ratings
- Budget-aware hiring and a persistent Current Staff roster
- Resource-based news that reacts to staff appointments
- A dynamic dashboard with hiring progress and generated headlines
- Runtime career state and an expanded future-ready `SaveData` resource
- Consistent fade transitions and generated silhouette portraits
- A shared UI theme and maintainable scene-based architecture

Simulation and save/load systems remain intentionally out of scope.

## Running the project

1. Install Godot 4.3 or newer.
2. Import `project.godot` from the Godot Project Manager.
3. Run the project with **F6** or **F5**.

## Project structure

```text
assets/          Project artwork and icons
scenes/          Godot scenes grouped by feature
scripts/core/    Cross-scene application state
scripts/data/    Serialization-ready data resources
scripts/ui/      Scene-specific presentation logic
themes/          Shared UI theme resources
```
