#!/bin/bash
#
# Install rust and cargo with rustup.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rustup fish-shell completions.
rustup completions fish > ~/.config/fish/completions/rustup.fish
