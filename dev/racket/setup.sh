#!/bin/bash
#
# Install Racket.

# Version. Update as required.
VERSION=8.3

# Architecture.
ARCH=aarch64

# Only works on macOS.
[[ $(uname) = Darwin ]] || return 1

# Download Racket from https://racket-lang.org/download/.
wget https://download.racket-lang.org/installers/$VERSION/racket-$VERSION-$ARCH-macosx-cs.dmg

# Install Racket.
echo 'Install Racket to /Applications/Racket'
open "racket-$VERSION-$ARCH-macosx-cs.dmg"
