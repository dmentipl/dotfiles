tmux
====

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Install via Homebrew

```bash
brew install tmux
```

or apt.

```bash
sudo apt install tmux
```

Link `tmux.conf`

```bash
ln -sf "${DOTDIR}/tmux/tmux.conf" ~/.tmux.conf
```
