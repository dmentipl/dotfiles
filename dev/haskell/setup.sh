#!/bin/bash
#
# Install Haskell with ghcup. Installs the following:
#
# ghcup - The Haskell toolchain installer
# ghc   - The Glasgow Haskell Compiler
# cabal - The Cabal build tool for managing Haskell software
# stack - (optional) A cross-platform program for developing Haskell projects
# hls   - (optional) A language server for editor integration
#
# Installs file into $HOME at the following locations:
#
# ~/.cabal/bin
# ~/.ghcup/bin
#
# These directories need to be on the $PATH to use Haskell after installation.
#
# The script is interactive and requires user input, for example, to choose to
# install optional software.

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
