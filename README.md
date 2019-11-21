Set up macOS from scratch
=========================

This repository contains dotfiles and instructions on setting up a macOS machine from scratch.

*Note: these instructions work for me. They may not work for you.*

Before cloning this repository
------------------------------

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

Set up ssh keys to clone this repository from <https://github.com>. Run the following command

```bash
ssh-keygen -t rsa
```

then add the public key at <https://github.com>.

Clone the repository
--------------------

*Note: if you are not me, you may want to fork this repository, instead of cloning mine.*

Clone the repository with

```bash
mkdir ~/repos && cd ~/repos
git clone git@github.com:dmentipl/dotfiles
```

Using the dotfiles
------------------

In what follows, you must set the shell variable `DOTFILES` to the directory in which you cloned this repository.

```bash
DOTFILES=~/repos/dotfiles
```

Homebrew
--------

> The missing package manager for macOS: <https://brew.sh/>.

Install Homebrew.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Update and run `brew doctor` to see if there are any problems.

```bash
brew update && brew doctor
```

Install software listed in `Brewfile`.

```bash
cd homebrew && brew bundle && cd -
```

This includes installation of iTerm2 the terminal replacement. Switch to this after running `brew bundle`.

fish
----

> fish is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family <https://fishshell.com/>.

Change shell to fish. It should be installed via Homebrew.

```bash
sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/fish
```

Install Fisher.

> A package manager for the fish shell. <https://git.io/fisher>.

```bash
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

### Configuration

Symlink config files.

```bash
ln -sf $DOTFILES/fish/config.fish ~/.config/fish/config.fish
ln -sf $DOTFILES/fish/abbr.fish ~/.config/fish/abbr.fish
ln -sf $DOTFILES/fish/fishfile ~/.config/fish/fishfile
```

Symlink functions.

```bash
mkdir ~/.config/fish/functions
set --local files $DOTFILES/fish/functions/*
for path in $files
  set --local file (string replace -r ".*/" "" -- $path)
  ln -sf $path $HOME/.config/fish/functions/$file
end
```

The prompt is provided by Starship.

> The cross-shell prompt for astronauts <https://starship.rs>.

```bash
ln -sf $DOTFILES/fish/starship.toml ~/.config/starship.toml
```

Python
------

Set up a Python development environment using Conda.

> Package, dependency and environment management for any language: <https://docs.conda.io/>.

### Conda

Download and install Miniconda. Miniconda is a bare Conda distribution including Python, pip, Conda, and not much else.

```bash
cd ~/Downloads || return
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-*-x86_64.sh
cd -
```

Install Python packages into the base environment with Conda. Before running this command, make sure to be in the base environment (`conda activate base`).

```bash
conda update conda
conda install --file python/base.yml
```

### pip

Install extra Python packages (not available with Conda) with pip.

```bash
pip install -r python/requirements.txt
```

### Jupyter

> JupyterLab is a web-based interactive development environment for Jupyter notebooks, code, and data: <https://jupyter.org/>.

Install Jupyter Lab extensions.

```bash
jupyter labextension install (cat python/jupyterlab_extension.txt)
```

### Configuration

Link Python config files.

```bash
ln -sf $DOTFILES/python/condarc ~/.condarc
ln -sf $DOTFILES/python/pycodestyle ~/.config/pycodestyle
```

Neovim
------

> Hyper-extensible Vim-base text editor: <https://neovim.io/>.

Should already be installed via Homebrew, and the Python package via pip. If not:

```bash
brew install neovim
pip install pynvim
```

Link config file.

```bash
ln -sf $DOTFILES/nvim/init.vim ~/.config/nvim/init.vim
```

### Plugins

> Minimalist Vim plugin manager: <https://github.com/junegunn/vim-plug>.

Install vim-plug, the plugin manager, and plugins.

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
```

Visual Studio Code
------------------

> Microsoft open source code editor: <https://code.visualstudio.com/>.

Download from <https://code.visualstudio.com/download>. Extract the zip file and copy the application to `/Applications`.

### Launching from the command line

To run VS Code from the terminal by typing 'code'.

1. Launch VS Code.
2. Open the Command Palette (shift-command-P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command.

Running this command links `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code` to `/usr/local/bin/code`.

### Install extensions

Install extensions listed in `vscode-extensions.txt`.

```bash
grep -v '^#' vscode/extensions.txt | xargs -L1 code --install-extension
```

### Symlink settings

Symlink config file `setting.json`, keybindings file `keybindings.json`, and dictionary file `spellright.dict`.

```bash
ln -sf $DOTFILES/vscode/settings.json \
    ~/Library/Application Support/Code/User/settings.json
ln -sf $DOTFILES/vscode/keybindings.json \
    ~/Library/Application Support/Code/User/keybindings.json
ln -sf $DOTFILES/vscode/spellright.dict \
    ~/Library/Application Support/Code/User/spellright.dict
```

Extra config
------------

### git

Symlink `gitconfig` and `gitignore` files.

```bash
ln -sf $DOTFILES/git/gitconfig ~/.gitconfig
ln -sf $DOTFILES/git/gitignore ~/.gitignore
```

Note that you may want to store sensitive information which would otherwise go in `.gitconfig` in `~/.gitconfig.local` which should not go in a public repository.

### fzf

> The fuzzy command-line finder: <https://github.com/junegunn/fzf>.

Should already be installed via Homebrew. If not:

```bash
brew install fzf
```

Install fzf fish key bindings.

```bash
ln -sf /usr/local/opt/fzf/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish
```

### tmux

> A terminal multiplexer: <https://github.com/tmux/tmux/wiki>.

Should already be installed via Homebrew. If not:

```bash
brew install tmux
```

Link the configuration file.

```bash
ln -sf $DOTFILES/tmux/tmux.conf ~/.tmux.conf
```

System Preferences
------------------

Change caps lock to control.

> System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

To set desktop background (wallpaper), first quit System Preferences, if open, then download the file and set it as the background.

```bash
osascript -e 'tell application "System Preferences" to quit'

cd ~/Pictures
wget https://upload.wikimedia.org/wikipedia/commons/9/9e/Milky_Way_IR_Spitzer.jpg
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$HOME/Pictures/Milky_Way_IR_Spitzer.jpg\""
```

To set the macOS defaults run the `macOS_defaults.sh` shell script:

```bash
./macos/macOS_defaults.sh
```

Read the script to see what it does, and change parts as required.

Fonts
-----

Install fonts: 'Inconsolata for Powerline' is a fixed-width font.

```bash
FONTDIR=~/Library/Fonts
cd ~/Downloads
URL=https://github.com/powerline/fonts/blob/master/Inconsolata
curl -L \
  "$URL/Inconsolata%20Bold%20for%20Powerline.ttf?raw=true" \
  -o Inconsolata\ Bold\ for\ Powerline.ttf
curl -L \
  "$URL/Inconsolata%20for%20Powerline.otf?raw=true" \
  -o Inconsolata\ for\ Powerline.otf
cp Inconsolata\ Bold\ for\ Powerline.ttf $FONTDIR
cp Inconsolata\ for\ Powerline.otf $FONTDIR
```

Colours
-------

Download and install manually from <https://iterm2colorschemes.com/>. I use 'Monokai Soda'.
