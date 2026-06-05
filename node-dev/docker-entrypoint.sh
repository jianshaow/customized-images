#!/bin/bash

set -e

if [ -f "$HOME/.profile" ] ; then
    . "$HOME/.profile"
fi

if [ -n "$EXTRA_PATH" ]; then
    export PATH=$EXTRA_PATH:$PATH
fi

exec "$@"
