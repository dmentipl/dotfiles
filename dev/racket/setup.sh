#!/bin/bash
#
# Install Racket.
#
# The following directory must be on the $PATH
#
#   /Applications/Racket/bin
#
# See envrc.

# Version. Update as required.
VERSION=8.4

# Architecture.
ARCH=aarch64

# Only works on macOS.
[[ $(uname) = Darwin ]] || return 1

# Download Racket from https://racket-lang.org/download/.
wget https://download.racket-lang.org/installers/$VERSION/racket-$VERSION-$ARCH-macosx-cs.dmg

# Install Racket.
echo 'Install Racket'
open "racket-$VERSION-$ARCH-macosx-cs.dmg"

# Symlink current version to /Applications/Racket.
ln -sfn "/Applications/Racket v$VERSION" /Applications/Racket
