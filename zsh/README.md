Set up terminal
===============

zsh
---

Change shell to zsh.

```bash
if [[ $OSTYPE =~ ^darwin ]]; then
  brew install bash
  brew install zsh
  sudo dscl . -create "/Users/${USER}" UserShell /usr/local/bin/zsh
else
  sudo apt install -y zsh
  chsh -s /bin/zsh
fi
```

Add zsh extras such as autosuggestions when typing, completion, syntax
highlighting, shell prompt.

```
mkdir -p ~/.local/share/zsh/{functions,repos}

cd ~/.local/share/zsh/repos || return 1
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/denysdovhan/spaceship-prompt
git clone https://github.com/esc/conda-zsh-completion

ln -sf ~/.local/share/zsh/repos/spaceship-prompt/spaceship.zsh \
  ~/.local/share/zsh/functions/prompt_spaceship_setup
```

Symlink config files.

```bash
ln -sf "${DOTDIR}/zsh/zshenv"   ~/.zshenv
ln -sf "${DOTDIR}/zsh/zshrc"    ~/.zshrc
ln -sf "${DOTDIR}/zsh/zshenv.d" ~/.zshenv.d
ln -sf "${DOTDIR}/zsh/zshrc.d"  ~/.zshrc.d
```

Colours
-------

For macOS download and install manually from https://github.com/mbadolato/iTerm2-Color-Schemes.

For Ubuntu we can use https://github.com/Mayccoll/Gogh.
```bash
wget -O gogh https://git.io/vQgMr
chmod +x gogh
printf '10 33 85 87 88' | ./gogh
\rm gogh
```

This downloads the following terminal colorschemes

- 10 = Atom
- 33 = Dimmed Monokai
- 85 = Molokai
- 87 = Monokai Dark
- 88 = Monokai Soda

Monokai Soda is my preferred colorscheme.
