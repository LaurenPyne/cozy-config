#!/usr/bin/env sh

launch() {
    if [ "${BWRAP_DEBUG:-0}" = "1" ]; then
        printf 'Bubblewrap command:\n\n'

        for arg in $BWRAP_ARGS; do
            printf '  %s\n' "$arg"
        done

        printf '\n'
        set -x
    fi

    exec bwrap $BWRAP_ARGS "$@"
}
