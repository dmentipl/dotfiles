#!/bin/bash
#
# Use Leiningen to install Clojure.
#
# Leiningen and Clojure require Java. (OpenJDK version 8.)
# See https://leiningen.org/ for details.

# Download the lein script (or on Windows lein.bat)
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

# Place it on your $PATH where your shell can find it (eg. ~/bin)
mv lein ~/bin

# Set it to be executable (chmod a+x ~/bin/lein)
chmod a+x ~/bin/lein

# Run it (lein) and it will download the self-install package
lein

# You can then start a REPL with `lein repl`. It may take some time to download
# and install Clojure when run for the first time.
lein repl
