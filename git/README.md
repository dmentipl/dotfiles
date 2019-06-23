git
===

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Symlink gitconfig and gitignore files.

```bash
ln -sf "${DOTDIR}/git/gitconfig" ~/.gitconfig
ln -sf "${DOTDIR}/git/gitignore" ~/.gitignore
```

Note that sensitive information which would usually go in `.gitconfig` is stored in `~/.gitconfig.local` which should not go in a public repository.
