#!/bin/bash
#
# Install Mambaforge conda at ~/conda from
# https://github.com/conda-forge/miniforge.
#
# After installation Conda needs to be initialized to be used.
# See conda-init.fish.

# Get OS
if [[ $(uname) == Linux ]]; then
    OS=Linux
elif [[ $(uname) == Darwin ]]; then
    OS=MacOSX
fi

# Download and run installer
INSTALLER="Mambaforge-$OS-x86_64.sh"
URL="https://github.com/conda-forge/miniforge/releases/latest/download/$INSTALLER"
wget "$URL" && bash "$INSTALLER" -b -p "$HOME/conda" && rm "$INSTALLER"

# Activate base and install packages
conda-init
mamba install --file environment.yml
