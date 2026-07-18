#!/usr/bin/env sh

set_env() {
    add_arg --setenv
    add_arg "$1"
    add_arg "$2"
}
