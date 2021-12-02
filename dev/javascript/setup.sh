#!/bin/bash
#
# Install volta for managing node versions.

# Install volta
curl https://get.volta.sh | bash -s -- --skip-setup

# Install node
volta install node
