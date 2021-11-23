#!/bin/bash
#
# Install node.js and npm from https://nodejs.org/.

# Version. Update as required.
VERSION=v16.13.0

# Fix permissions if True.
FIX_PERMISSIONS=true

# Only works on macOS.
[[ $(uname) = Darwin ]] || return 1

# Download installer.
wget "https://nodejs.org/dist/$VERSION/node-$VERSION.pkg"

# Run installer.
echo 'Run installer'
open "node-$VERSION.pkg"

# You may need to fix permissions on /usr/local. E.g.
if $FIX_PERMISSIONS; then
    sudo chown -R "$USER" /usr/local/*
fi
