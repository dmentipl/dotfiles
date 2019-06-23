LaTeX
=====

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Install via Homebrew Cask on macOS,

```bash
brew cask install mactex
```

or via apt on Linux.

```bash
sudo apt install texlive-full
```

Link `${TEXMFHOME}` directory and `latexmkrc`.

```bash
ln -sf "${DOTDIR}/tex/texmf" ~/.texmf
ln -sf "${DOTDIR}/tex/latexmkrc.${OS}" ~/.latexmkrc
```
