#!/usr/bin/env sh

gui_profile() {
    #
    # Runtime socket directory
    #
    bind_rw "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR"

    #
    # GUI environment
    #
    [ -n "${XDG_RUNTIME_DIR:-}" ] &&
        set_env XDG_RUNTIME_DIR "$XDG_RUNTIME_DIR"

    [ -n "${WAYLAND_DISPLAY:-}" ] &&
        set_env WAYLAND_DISPLAY "$WAYLAND_DISPLAY"

    [ -n "${DISPLAY:-}" ] &&
        set_env DISPLAY "$DISPLAY"

    [ -n "${DBUS_SESSION_BUS_ADDRESS:-}" ] &&
        set_env DBUS_SESSION_BUS_ADDRESS "$DBUS_SESSION_BUS_ADDRESS"

    [ -n "${XDG_SESSION_TYPE:-}" ] &&
        set_env XDG_SESSION_TYPE "$XDG_SESSION_TYPE"
}
