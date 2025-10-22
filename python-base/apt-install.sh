#!/usr/bin/env bash
apt-get update
if [ "$1" == "-f"]; then
    apt-get install -y --no-install-recommends $(sed -e '/^\s*#.*$/d' -e '/^\s*$/d' "$2" | sort -u)
else
    apt-get install -y --no-install-recommends $@
fi
apt-get clean
rm -rf /var/lib/apt/lists/*
