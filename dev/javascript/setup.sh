#!/bin/bash
#
# Install node.js and npm.

# Options
VERSION=v16.13.0
FIX_PERMISSIONS=True

# Download node.js pkg from https://nodejs.org/ and install.
# This provides node and npm.
wget "https://nodejs.org/dist/$VERSION/node-$VERSION.pkg"

# You may need to fix permissions on /usr/local. E.g.
if $FIX_PERMISSIONS; then
    sudo chown -R "$USER" /usr/local/*
fi
