#!/usr/bin/env sh

#
# Shared filesystem and runtime for every sandbox.
#
base_profile() {
    #
    # Read-only system
    #
    bind_ro /nix /nix
    bind_ro /run/current-system /run/current-system
    bind_ro /usr /usr
    bind_ro /etc/profiles /etc/profiles
    bind_ro /etc/static /etc/static

    #
    # Home Manager profile data
    #
    mkdir_p "$HOME/.local"
    mkdir_p "$HOME/.local/state"

    if [ -d "$HOME/.local/state/nix" ]; then
        bind_rw \
            "$HOME/.local/state/nix" \
            "$HOME/.local/state/nix"
    fi

    #
    # Kernel interfaces
    #
    devfs /dev
    procfs /proc

    #
    # Temporary filesystem
    #
    tmpfs /tmp

    #
    # Writable user directories
    #
    mkdir_p "$HOME/.cache"
    mkdir_p "$HOME/.cache/fontconfig"
    mkdir_p "$HOME/.config"
    mkdir_p "$HOME/.local"

    bind_rw "$HOME/.cache" "$HOME/.cache"
    bind_rw "$HOME/.config" "$HOME/.config"
    bind_rw "$HOME/.local" "$HOME/.local"

    #
    # Environment
    #
    set_env HOME "$HOME"
}
# Interactive development shell
#
shell_profile() {
    base_profile

    bind_rw "$PROJECT_DIR" /workspace
    chdir /workspace
}

#
# LibreWolf browser
#
librewolf_profile() {
    base_profile
    gui_profile

    bind_rw "$PROJECT_DIR" /workspace
    chdir /workspace

    #
    # Future:
    #
    # bind_rw "$HOME/Downloads" "$HOME/Downloads"
    # bind_rw "$HOME/.librewolf" "$HOME/.librewolf"
}

#
# Visual Studio Code
#
vscode_profile() {
    base_profile
    gui_profile

    bind_rw "$PROJECT_DIR" /workspace
    chdir /workspace

    #
    # VS Code state
    #
    mkdir_p "$HOME/.vscode"

    bind_rw "$HOME/.config/Code" "$HOME/.config/Code"
    bind_rw "$HOME/.vscode" "$HOME/.vscode"
}

#
# OpenClaw AI sandbox
#
openclaw_profile() {
    base_profile
    gui_profile

    # OpenClaw workspace
    bind_rw "$HOME/Workspace/openclaw" /workspace
    chdir /workspace

    # Application state
    mkdir_p "$HOME/.config/openclaw"
    mkdir_p "$HOME/.cache/openclaw"
    mkdir_p "$HOME/.local/share/openclaw"

    bind_rw "$HOME/.config/openclaw" "$HOME/.config/openclaw"
    bind_rw "$HOME/.cache/openclaw" "$HOME/.cache/openclaw"
    bind_rw "$HOME/.local/share/openclaw" "$HOME/.local/share/openclaw"
}

