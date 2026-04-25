#!/bin/bash

set -e

if [ -f "$HOME/.profile" ] ; then
    . "$HOME/.profile"
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -d "$HOME/.venv" ]; then
    export VIRTUAL_ENV="$HOME/.venv"
    export PATH="$VIRTUAL_ENV/bin:$PATH"
fi

if [ -n "$EXTRA_PATH" ]; then
    export PATH=$EXTRA_PATH:$PATH
fi

exec "$@"
