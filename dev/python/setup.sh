#!/bin/bash
#
# Install Mambaforge conda at ~/conda from
# https://github.com/conda-forge/miniforge.

# Get OS
[[ $(uname) == Linux ]] && OS=Linux
[[ $(uname) == Darwin ]] && OS=MacOSX

# Download and run installer
INSTALLER="Mambaforge-$OS-x86_64.sh"
URL="https://github.com/conda-forge/miniforge/releases/latest/download/$INSTALLER"
wget "$URL" && bash "$INSTALLER" -b -p "$HOME/conda" && rm "$INSTALLER"

# Activate base and install packages
conda activate base
mamba install --file environment.yml
