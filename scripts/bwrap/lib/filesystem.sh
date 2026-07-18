#!/usr/bin/env sh

bind_ro() {
    add_arg --ro-bind
    add_arg "$1"
    add_arg "$2"
}

bind_rw() {
    add_arg --bind
    add_arg "$1"
    add_arg "$2"
}

tmpfs() {
    add_arg --tmpfs
    add_arg "$1"
}

procfs() {
    add_arg --proc
    add_arg "$1"
}

devfs() {
    add_arg --dev
    add_arg "$1"
}

chdir() {
    add_arg --chdir
    add_arg "$1"
}

mkdir_p() {
    add_arg --dir
    add_arg "$1"
}
