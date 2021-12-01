#!/bin/bash
#
# Install node.js and npm using nvm.fish.
#
# Note: to use node/npm after installation requires, e.g.
#
#  nvm use latest

# Install nvm.fish
fisher install jorgebucaran/nvm.fish

# Install latest node.js and npm
nvm install latest
