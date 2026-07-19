#!/usr/bin/env sh

bind_home_rw() {
    mkdir_p "$1"
    bind_rw "$1" "$1"
}

bind_home_ro() {
    mkdir_p "$(dirname "$1")"

    if [ -e "$1" ]; then
        bind_ro "$1" "$1"
    fi
}

set_home_env() {
    set_env HOME "$HOME"
}
