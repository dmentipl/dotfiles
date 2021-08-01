# dotfiles

> dotfiles for macOS and Linux machines with nix

## Description

This is a set of dotfiles and installation scripts appropriate for machines running macOS and Linux using [nix](https://nixos.org/).

The main aim is to have the following installed and configured:

> fish, fzf, git, neovim, starship, tmux, vscode

*Plus a handful of command line tools.

### Caveat

These files are useful to me ([@dmentipl](https://github.com/dmentipl)). They *might* be useful to you.

## Requirements

There are two main requirements:

1. Nix; see <https://nixos.org/guides/install-nix.html>.
2. Home-manager; see <https://github.com/nix-community/home-manager#installation>.

*Note*: for nix binaries to be available on the path run the following.

```bash
. ~/.nix-profile/etc/profile.d/nix.sh
```

## Usage

1. Clone this repository locally (or download a tarball/zip archive) to

    ```bash
    ~/repos/dotfiles
    ```

2. Symlink `home.nix` to `~/.config/nixpkgs`:

    ```bash
    ln -s ~/repos/dotfiles/home.nix ~/.config/nixpkgs/home.nix
    ```

3. Run home-manager:

    ```bash
    home-manager switch
    ```

Each time you make a change to `home.nix` or any other file you need to run the home-manager switch command.

## Further details

### Repo

The dotfiles live in the `config` directory; examples include `gitconfig`, `tmux.conf`, and `vimrc`.

### Applications

Using this repo will install and configure these applications (amongst others).

- Fish

> fish is a smart and user-friendly command line shell for Linux, macOS, and the rest of the family <https://fishshell.com/>.

- fzf

> The fuzzy command-line finder: <https://github.com/junegunn/fzf>.

- Neovim

> Hyper-extensible Vim-base text editor: <https://neovim.io/>.

- Starship

> The cross-shell prompt for astronauts <https://starship.rs>.

- tmux

> A terminal multiplexer: <https://github.com/tmux/tmux/wiki>.

- VS Code

> Microsoft open source code editor: <https://code.visualstudio.com/>.

## macOS specific

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

Change caps lock to control.

> System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

Download and install color schemes manually from <https://iterm2colorschemes.com/>. I like 'Monokai Soda'.

The `mac.sh` file in the `config` directory contains a collection of nice-to-have defaults that you would otherwise set using System Preferences. This is derived from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles).

### Desktop applications

I install the following applications "manually".

- Brave
- Flux
- Gestimer
- iStat Menus
- iTerm
- KeepingYouAwake
- Obsidian
- ProtonVPN
- Signal
- Spotify
- VS Code
