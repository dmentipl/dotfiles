dotfiles
========

> dotfiles for macOS and Linux machines

Description
-----------

This is a set of dotfiles appropriate for macOS and Linux machines (including remote machines where I may not have root access).

The main aim is to have the following installed and configured:

> bash, code, conda, fish, fzf, git, neovim, starship, tmux, vim, zsh

See below for further details about these applications.

Usage
-----

Clone this repository locally (or download a tarball/zip archive). Then run the bootstrap script and follow the prompts.

```bash
./bootstrap.sh
```

You can separately run the `install.sh` and `configure.sh` scripts to install applications and configure dotfiles, respectively. The latter is particular is useful to reconfigure dotfiles after making changes.

Structure
---------

### Config

The dotfiles live in the `config` directory.

```
config
├── abbr.fish
├── aliases
├── bashrc
├── condarc
├── config.fish
├── gitconfig
├── gitignore
├── settings.json
├── starship.toml
├── tmux.conf
├── vimrc
└── zshrc
```

### Install

Files relating to setup and installation live in the `install` directory.

```
install
├── Brewfile
├── extensions.txt
├── mac.sh
└── pkglist.txt
```

`Brewfile` contains programs and casks for Homebrew to install. The `extensions.txt` file contains a list of VS Code extensions. The `pkglist.txt` files contains programs to install via apt or dnf.

Further details
---------------

### Applications

The bootstrap script will attempt to install the following applications (amongst others).

- Conda

> Package, dependency and environment management for any language: <https://docs.conda.io/>.

- Fish

> fish is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family <https://fishshell.com/>.

- fzf

> The fuzzy command-line finder: <https://github.com/junegunn/fzf>.

- Homebrew

> The missing package manager for macOS: <https://brew.sh/>.

- Neovim

> Hyper-extensible Vim-base text editor: <https://neovim.io/>.

> Minimalist Vim plugin manager: <https://github.com/junegunn/vim-plug>.

- Starship

> The cross-shell prompt for astronauts <https://starship.rs>.

- tmux

> A terminal multiplexer: <https://github.com/tmux/tmux/wiki>.

- VS Code

> Microsoft open source code editor: <https://code.visualstudio.com/>.

### macOS specific

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

Change caps lock to control.

> System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

Download and install colorschemes manually from <https://iterm2colorschemes.com/>. I like 'Monokai Soda'.

The `mac.sh` file in the `install` directory contains a collection of nice-to-have defaults that you would otherwise set using System Preferences. This is derived from <https://github.com/mathiasbynens/dotfiles>.
