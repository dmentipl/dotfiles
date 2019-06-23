bin
===

This directory contains useful binaries.

Link binaries to `~/bin`.

```
mkdir -p ~/bin
files=("${DOTDIR}"/bin/*)
for file in "${files[@]}"; do
  ln -sf "${DOTDIR}/bin/${file:t}" "$HOME/bin/${file:t}"
done
```
