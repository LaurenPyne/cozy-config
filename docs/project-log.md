# Cozy Project Log

An engineering journal documenting the evolution of Cozy.

---

## Session 1 — Foundation

### Completed

- Created flake-based NixOS configuration
- Added Home Manager
- Began modular project structure

### Commit Highlights

- Initial Cozy structure

### Next

- Continue modularization

---

## Session 2 — Modular Architecture

### Completed

- Extracted networking
- Created reusable module hierarchy
- Separated host-specific configuration

### Commit Highlights

- Extract networking into core module

### Next

- Terminal modules

---

## Session 3 — Terminal Foundation

### Completed

- Added Ghostty module
- Added Fish module
- Configured Ghostty to launch Fish
- Added Starship
- Added Eza
- Added Zoxide

### Commit Highlights

- Add terminal module structure
- Add Fish shell module
- Configure Ghostty with Fish defaults

### Next

- VS Code

---

## Session 4 — VS Code

### Completed

- Added Home Manager VS Code module
- Added Nix tooling
- Added Rust tooling
- Added Python tooling
- Added Lua tooling
- Added Remote SSH
- Added Live Server
- Added GitLens
- Added GitHub Pull Requests
- Added Fish support

### Next

- Terminal utilities

---

## Session 5 — Terminal Utilities

### Completed

Added reproducible command-line utilities.

Installed:

- bat
- eza
- fd
- tree
- ripgrep
- fzf
- jq
- btop
- unzip
- zip
- p7zip
- curl
- wget
- file
- which
- killall

### Next

- Fish workflow

---

## Session 6 — Fish Workflow

### Completed

Added workflow functions.

Implemented:

- cfg
- rebuild
- update
- clean
- mkcd

Improved shell organization.

### Commit

Add Fish workflow functions

### Next

- Starship polish

---

## Current Status

✓ Flakes

✓ Home Manager

✓ Modular architecture

✓ VS Code

✓ Rust

✓ Python

✓ Lua

✓ Ghostty

✓ Fish

✓ Starship

✓ Terminal utilities

✓ Fish workflow

---

## Upcoming Roadmap

- Starship polish
- Ghostty polish
- Secrets (sops-nix)
- DevShells
- Bubblewrap
- OpenClaw
- Documentation
- v0.1.0
## Session 7 — Starship Polish

### Completed

Refined the Starship prompt to better reflect Cozy's design philosophy.

Improvements:

- Better directory display
- Explicit Git status symbols
- Command duration
- SSH-only hostname
- Improved Nix shell indicator
- Cleaner language modules

### Result

A minimal prompt that answers four questions:

- Where am I?
- Is my repository clean?
- What environment am I in?
- Did the last command take a while?

### Commit

Polish Starship configuration

### Next

Ghostty polish
