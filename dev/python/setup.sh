#!/bin/bash
#
# Install Mambaforge conda at ~/conda.
# From https://github.com/conda-forge/miniforge.
#
# Conda needs to be initialized. See conda-init.fish.

if [[ $(uname) == Linux ]]; then
    OS=Linux
elif [[ $(uname) == Darwin ]]; then
    OS=MacOSX
fi
INSTALLER="Mambaforge-$OS-x86_64.sh"
URL="https://github.com/conda-forge/miniforge/releases/latest/download/$INSTALLER"
wget "$URL" && bash "$INSTALLER" -b -p "$HOME/conda" && rm "$INSTALLER"
