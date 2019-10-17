git
===

Symlink `gitconfig` and `gitignore` files.

```bash
ln -sf "${DOTFILES}/git/gitconfig" ~/.gitconfig
ln -sf "${DOTFILES}/git/gitignore" ~/.gitignore
```

Note that you should store sensitive information which would otherwise go in `.gitconfig` in `~/.gitconfig.local` which should not go in a public repository.
