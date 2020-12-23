Dotfiles
========

> Dotfiles for macOS and Linux machines

This is a set of dotfiles appropriate for macOS and Linux machines (including remote machines where I may not have root access).

The main aim is to have the following set up:

- bash, fish, zsh, tmux
- git
- code, vim, neovim
- fzf, starship
- conda

Installation
------------

Clone this repository locally (or download a tarball/zip archive). Then run the bootstrap script and follow the prompts.

```bash
./bootstrap.sh
```

Alternatively, you can just run the `install.sh` and `configure.sh` scripts separately to install applications and configure dotfiles, respectively. The latter is particular is useful to reconfigure dotfiles after making changes.

Structure
---------

The dotfiles live in the `configuration` directory.

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

Files relating to setup and installation live in the `install` directory.

```
install
├── Brewfile
├── extensions.txt
├── macOS_defaults.sh
└── pkglist.txt
```
