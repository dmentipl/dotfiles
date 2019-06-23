bin
===

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

This directory contains useful binaries.

Link binaries to `~/bin`.

```
mkdir -p ~/bin
files=("${DOTDIR}"/bin/*)
for file in "${files[@]}"; do
  ln -sf "${DOTDIR}/bin/${file:t}" "$HOME/bin/${file:t}"
done
```
