# Bubblewrap Framework

## Overview

The Bubblewrap framework provides a reusable, modular system for launching
applications inside isolated Bubblewrap sandboxes.

Rather than writing one large Bubblewrap command for every application, the
framework composes small helper libraries and application profiles.

Each launcher simply selects a profile and launches an executable.

---

# Directory Structure

```
scripts/
└── bwrap/
    ├── lib/
    │   ├── args.sh
    │   ├── bootstrap.sh
    │   ├── env.sh
    │   ├── filesystem.sh
    │   ├── gui.sh
    │   ├── launch.sh
    │   └── profiles.sh
    │
    ├── shell
    ├── vscode
    ├── librewolf
    └── openclaw
```

---

# Design Philosophy

The framework follows the same modular design philosophy used throughout the
rest of the Cozy configuration.

Instead of large monolithic scripts:

```
launcher
    ↓
profile
    ↓
helper functions
    ↓
Bubblewrap arguments
```

Each helper performs one job.

Examples include:

- mounting filesystems
- creating directories
- exposing GUI sockets
- setting environment variables
- launching applications

---

# Helper Libraries

## args.sh

Responsible for building the Bubblewrap argument list.

Provides:

- add_arg()

---

## filesystem.sh

Filesystem helper functions.

Provides:

- bind_ro()
- bind_rw()
- mkdir_p()
- tmpfs()
- procfs()
- devfs()
- chdir()

These functions hide the Bubblewrap syntax and make profiles easier to read.

---

## env.sh

Environment helpers.

Provides:

- set_env()

---

## gui.sh

GUI-related mounts.

Responsible for exposing:

- Wayland socket
- DBus session bus
- XDG_RUNTIME_DIR
- PipeWire
- other desktop services

Applications that require a graphical interface simply call:

```
gui_profile
```

---

## launch.sh

Contains the final launcher.

```
launch command args...
```

This expands the collected Bubblewrap arguments before executing the application.

---

## bootstrap.sh

Loads every helper library.

Every launcher begins with:

```sh
. "$SCRIPT_DIR/lib/bootstrap.sh"
```

This guarantees that every helper function is available.

---

# Profiles

Profiles describe filesystem layouts.

They should not launch applications.

---

## base_profile()

Provides the common environment shared by every sandbox.

Includes:

- /nix
- /usr
- /etc/profiles
- /etc/static
- HOME
- cache
- temporary filesystem
- Nix profile

Every other profile builds on top of base_profile().

---

## shell_profile()

Adds:

- project workspace

Launches an interactive shell inside the sandbox.

---

## vscode_profile()

Builds on:

- base_profile()
- gui_profile()

Adds:

- VS Code configuration
- extension directories
- workspace

---

## librewolf_profile()

Builds on:

- base_profile()
- gui_profile()

Provides browser-specific storage.

---

## openclaw_profile()

Builds on:

- base_profile()
- gui_profile()

Designed as an isolated AI agent environment.

Future versions should minimise host filesystem exposure.

---

# Launcher Structure

Every launcher should follow the same pattern.

```sh
#!/usr/bin/env sh

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"

. "$SCRIPT_DIR/lib/bootstrap.sh"

application_profile

launch application "$@"
```

This keeps launchers small and consistent.

---

# Adding a New Sandbox

Creating a new sandbox should require only:

1. Create a profile.

2. Create a launcher.

Example:

```sh
myapp_profile() {
    base_profile
    gui_profile

    bind_rw "$PROJECT_DIR" /workspace
    chdir /workspace
}
```

Launcher:

```sh
#!/usr/bin/env sh

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"

. "$SCRIPT_DIR/lib/bootstrap.sh"

myapp_profile

launch myapp "$@"
```

---

# Debugging

Useful commands:

View generated Bubblewrap arguments:

```sh
echo "$BWRAP_ARGS"
```

Verify mounted filesystems:

```sh
mount
```

Inspect filesystem:

```sh
ls /
```

Verify executable lookup:

```sh
which application
```

Inspect environment:

```sh
env
```

---

# Goals

The framework aims to provide:

- reusable profiles
- readable launchers
- minimal duplication
- application isolation
- easy extension
- predictable behaviour

Every launcher should describe **what** it needs rather than **how** Bubblewrap
works.

---

# Future Improvements

Potential additions include:

- network profiles
- read-only workspace profiles
- secrets profile
- Downloads profile
- Documents profile
- media profile
- temporary profiles
- testing profile

Applications should compose profiles rather than duplicate configuration.

---

# Philosophy

The Bubblewrap framework is intentionally treated as a subsystem of Cozy.

Like the NixOS modules, it favours:

- composition over duplication
- readable structure
- small reusable pieces
- explicit permissions
- incremental extension

The goal is for new sandboxes to require only a profile and a launcher while
the framework handles the implementation details.
