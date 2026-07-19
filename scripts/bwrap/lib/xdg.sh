#!/usr/bin/env sh

xdg_profile() {
    mkdir_p "$HOME/.cache"
    mkdir_p "$HOME/.config"
    mkdir_p "$HOME/.local"

    bind_rw "$HOME/.cache" "$HOME/.cache"
    bind_rw "$HOME/.config" "$HOME/.config"
    bind_rw "$HOME/.local" "$HOME/.local"
}
