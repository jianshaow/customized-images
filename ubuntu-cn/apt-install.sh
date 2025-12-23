#!/usr/bin/env bash
apt-get update
apt-get install -y --no-install-recommends $(sed -e '/^\s*#.*$/d' -e '/^\s*$/d' "$1" | sort -u)
if [ $# -gt 1 ]; then
    shift
    apt-get install -y --no-install-recommends $@
fi
apt-get clean
rm -rf /var/lib/apt/lists/*
