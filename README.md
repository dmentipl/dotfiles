Set up for macOS
================

This repository contains dotfiles and instructions on setting up a macOS machine from scratch.

*Note: these instructions work for me. Caveat emptor.*

Before cloning this repository
------------------------------

Install iTerm2 from <https://www.iterm2.com/>.

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

*Note: run this command after every macOS update.* Also, as of 10.14 (Mojave) you need to run:

```bash
open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
```

Follow the installer instructions.

*Note: If you're not me, skip this section. Clone a copy over HTTPS.  Alternatively, fork the repository and follow along.*

Set up ssh keys to clone this repository from github.com. Run the following command

```bash
ssh-keygen -t rsa
```

then add the public key at github.com. Once you do this you can clone the repository with

```bash
mkdir ~/repos
cd ~/repos
git clone git@github.com:dmentipl/dotfiles
```

In what follows, the shell variable `DOTFILES` is set to `~/repos/dotfiles`. This is whatever the directory this repository is cloned into.

zsh
---

Change shell to zsh.

```bash
sudo dscl . -create "/Users/${USER}" UserShell /bin/zsh
```

Add zsh extras such as autosuggestions when typing, completion, syntax highlighting, shell prompt.

```bash
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

Symlink config files. `zshenv` and `zshenv.d` are for all zsh shells, i.e. interactive and non-interactive. `zshrc` and `zshrc.d` are for interactive shells.

```bash
ln -sf "${DOTFILES}/zshenv" ~/.zshenv
ln -sf "${DOTFILES}/zshrc" ~/.zshrc

mkdir ~/.zshenv.d
files=("${DOTFILES}/zshenv.d/"*)
for file in "${files[@]}"; do
  [[ -f $file && -r $file ]] && ln -sf "$file" "$HOME/.zshenv.d/$file:t"
done
unset file files

mkdir ~/.zshrc.d
files=("${DOTFILES}/zshrc.d/"*)
for file in "${files[@]}"; do
  [[ -f $file && -r $file ]] && ln -sf "$file" "$HOME/.zshrc.d/$file:t"
done
unset file files
```

git
---

Symlink `gitconfig` and `gitignore` files.

```bash
ln -sf "${DOTFILES}/gitconfig" ~/.gitconfig
ln -sf "${DOTFILES}/gitignore" ~/.gitignore
```

Note that you should store sensitive information which would otherwise go in `.gitconfig` in `~/.gitconfig.local` which should not go in a public repository.

Homebrew
--------

Install Homebrew.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Update and run `brew doctor` to see if there are any problems.

```bash
brew update && brew doctor
```

Install from `Brewfile`.

```bash
brew bundle
```

Python
------

Download and install Anaconda.

```bash
cd ~/Downloads || return
curl -O $(${DOTFILES}/.latest_anaconda_install_script_url macOS)
bash Anaconda3-*-x86_64.sh
cd -
```

Install Python packages into the base environment with Conda. Before running this command, make sure to be in the base environment (`conda activate base`).

```bash
conda update conda
conda install --file base.yml
```

Install extra Python packages with pip.

```bash
pip install -r requirements.txt
```

Install Jupyter Lab extensions.

```bash
jupyter labextension install jupyterlab_vim
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib
```

Link Python config files.

```bash
ln -sf "${DOTFILES}/condarc" ~/.condarc
ln -sf "${DOTFILES}/pycodestyle" ~/.config/pycodestyle
```

Neovim
------

Installing and setting up Neovim.

```bash
brew install neovim
pip install pynvim
```

Link config file.

```bash
ln -sf "${DOTFILES}/init.vim" "${HOME}/.config/nvim/init.vim"
```

Install vim-plug, the plugin manager, and plugins.

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
```

Visual Studio Code
------------------

Download from <https://code.visualstudio.com/download>. Extract the zip file and copy the application to `/Applications`.

### Launching from the command line

To run VS Code from the terminal by typing 'code'.

1. Launch VS Code.
2. Open the Command Palette (shift-command-P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command.

Running this command links `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code` to `/usr/local/bin/code`.

### Install extensions

Install extensions listed in `vscode-extensions.txt`.

```bash
grep -v '^#' vscode-extensions.txt | xargs -L1 code --install-extension
```

### Symlink settings

Symlink config file `setting.json`, keybindings file `keybindings.json`, and dictionary file `spellright.dict`.

```bash
ln -sf "${DOTFILES}/vscode-settings.json" \
    "$HOME/Library/Application Support/Code/User/settings.json"
ln -sf "${DOTFILES}/vscode-keybindings.json" \
    "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -sf "${DOTFILES}/vscode-spellright.dict" \
    "$HOME/Library/Application Support/Code/User/spellright.dict"
```

macOS
-----

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
./macOS_defaults.sh
```

Read the script to see what it does, and change parts as required.

Fonts
-----

Install fonts.

```bash
FONTDIR=~/Library/Fonts
cd ~/Downloads
```

And 'Inconsolata for Powerline' for the terminal.

```bash
URL=https://github.com/powerline/fonts/blob/master/Inconsolata
curl -L \
  "${URL}/Inconsolata%20Bold%20for%20Powerline.ttf?raw=true" \
  -o Inconsolata\ Bold\ for\ Powerline.ttf
curl -L \
  "${URL}/Inconsolata%20for%20Powerline.otf?raw=true" \
  -o Inconsolata\ for\ Powerline.otf
cp Inconsolata\ Bold\ for\ Powerline.ttf $FONTDIR
cp Inconsolata\ for\ Powerline.otf $FONTDIR
```

Colours
-------

For macOS download and install manually from <https://github.com/mbadolato/iTerm2-Color-Schemes.>

fzf
---

Install fzf fuzzy completion key bindings.

```bash
$(brew --prefix)/opt/fzf/install
```

tmux
----

Link `tmux.conf`

```bash
ln -sf "${DOTFILES}/tmux.conf" ~/.tmux.conf
```

node.js
-------

I use node.js as a package manager for binaries made available through it. Not for JavaScript development.

Download and install node.js from <https://nodejs.org/.>

Need to set permissions.

```bash
sudo chown -R ${USER} /usr/local/lib/node_modules
```

Install node.js packages.

```bash
npm install -g alex
npm install -g htmlhint
npm install -g write-good
```

This installs the following packages.

- alex: linter for prose; catches insensitive, inconsiderate writing
- htmlhint: static code analysis tool for HTML
- write-good: naive linter for English prose
