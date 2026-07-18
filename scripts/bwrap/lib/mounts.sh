#!/usr/bin/env sh

BWRAP_ARGS=""

arg() {
    BWRAP_ARGS="$BWRAP_ARGS $*"
}

bind_ro() {
    arg --ro-bind
    arg "$1"
    arg "$2"
}

bind_rw() {
    arg --bind
    arg "$1"
    arg "$2"
}

tmpfs() {
    arg --tmpfs
    arg "$1"
}

procfs() {
    arg --proc
    arg "$1"
}

devfs() {
    arg --dev
    arg "$1"
}

chdir() {
    arg --chdir
    arg "$1"
}

unshare_net() {
    arg --unshare-net
}
