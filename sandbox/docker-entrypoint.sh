#!/bin/bash

set -e

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -n "$EXTRA_PATH" ]; then
    export PATH=$EXTRA_PATH:$PATH
fi

if [ $# -eq 0 ]; then
    set -- /bin/bash
fi

exec "$@"
