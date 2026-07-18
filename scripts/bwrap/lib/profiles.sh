#!/usr/bin/env sh

# Shared filesystem for every sandbox.
base_profile() {
    # Immutable system
    bind_ro /nix /nix
    bind_ro /run/current-system /run/current-system
    bind_ro /etc /etc

    # Kernel interfaces
    devfs /dev
    procfs /proc

    # Temporary storage
    tmpfs /tmp

    # Runtime directories
    mkdir_p "$HOME/.cache"
    mkdir_p "$HOME/.cache/fontconfig"
    mkdir_p "$HOME/.config"
    mkdir_p "$HOME/.local"
}

# Interactive development shell.
shell_profile() {
    base_profile

    # Project workspace
    bind_rw "$PROJECT_DIR" /workspace
    chdir /workspace
}
