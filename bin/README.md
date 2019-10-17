bin
===

This directory contains useful binaries.

Link binaries to `~/bin`.

```
mkdir -p ~/bin
files=("${DOTFILES}"/bin/*)
for file in "${files[@]}"; do
  ln -sf "${DOTFILES}/bin/${file:t}" "$HOME/bin/${file:t}"
done
```
