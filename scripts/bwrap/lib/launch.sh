#!/usr/bin/env sh

launch() {
    exec bwrap $BWRAP_ARGS "$@"
}
