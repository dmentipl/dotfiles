git
===

Symlink gitconfig and gitignore files.

```bash
ln -sf "${DOTFILES}/git/gitconfig" ~/.gitconfig
ln -sf "${DOTFILES}/git/gitignore" ~/.gitignore
```

Note that sensitive information which would usually go in `.gitconfig` is stored in `~/.gitconfig.local` which should not go in a public repository.
