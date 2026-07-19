#!/usr/bin/env sh

enable_wayland() {
    bind_rw "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR"

    set_env XDG_RUNTIME_DIR "$XDG_RUNTIME_DIR"
    set_env WAYLAND_DISPLAY "$WAYLAND_DISPLAY"
    set_env XDG_SESSION_TYPE "$XDG_SESSION_TYPE"
}

enable_x11() {
    set_env DISPLAY "$DISPLAY"
}

enable_dbus() {
    set_env DBUS_SESSION_BUS_ADDRESS "$DBUS_SESSION_BUS_ADDRESS"
}

enable_network() {
    # Future network isolation.
    :
}

enable_audio() {
    # PipeWire support later.
    :
}

enable_gpu() {
    # GPU device bindings later.
    :
}
