Setup Neovim
============

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Installing and setting up Neovim.

```bash
# Install
if [[ $OSTYPE =~ ^darwin ]]; then
  brew install neovim
else
  sudo apt-add-repository ppa:neovim-ppa/stable
  sudo apt install -y neovim
fi

# Python integration
pip install pynvim
```

Link config directory.

```bash
ln -sf "${DOTDIR}/vim/nvim" "${HOME}/.config/nvim"
```

Install vim-plug, the plugin manager.

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
```

Set the spell file.

```bash
nvim ~/.config/nvim/spell/en.utf-8.add +'mkspell! %'
```
