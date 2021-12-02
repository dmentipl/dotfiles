#!/bin/bash
#
# Install pyenv and conda (mamba).

# ============================================================================ #
# PYENV

curl https://pyenv.run | bash

# ============================================================================ #
# CONDA

# Download and install Mambaforge conda to ~/conda
[[ $(uname) == Linux ]] && INSTALLER="Mambaforge-Linux-x86_64.sh"
[[ $(uname) == Darwin ]] && INSTALLER="Mambaforge-MacOSX-arm64.sh"
URL="https://github.com/conda-forge/miniforge/releases/latest/download/$INSTALLER"
wget "$URL" && bash "$INSTALLER" -b -p "$HOME/conda" && rm "$INSTALLER"

# Activate base and install packages
conda activate base
mamba install --file environment.yml
