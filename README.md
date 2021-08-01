# dotfiles

> dotfiles for macOS and Linux machines with nix

## Description

This is a set of dotfiles and installation scripts appropriate for machines running macOS and Linux using [nix](https://nixos.org/) and [home-manager](https://github.com/nix-community/home-manager).

A small caveat: these files are useful to me ([@dmentipl](https://github.com/dmentipl)); they *might* also be useful to you.

## Requirements

There are two main requirements:

1. Nix; see <https://nixos.org/guides/install-nix.html>.
2. Home-manager; see <https://github.com/nix-community/home-manager#installation>.

*Note*: if the nix command is not on the path run the following.

```bash
. ~/.nix-profile/etc/profile.d/nix.sh
```

After installation, home-manager will ensure nix is properly configured.

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

### Managed by nix and home-manager

Nix and home-manager install applications as listed in `home.nix`. They also manage the dotfiles in `config` and symlink them to the correct locations.

### Not managed by nix and home-manager

The following are not (yet) managed by nix and home-manager.

- macOS defaults. See `install/mac.sh` for details. To set defaults, run the script as follows

    ```bash
    bash install/mac.sh
    ```

- VS Code extensions. See `install/extensions.json` for the list of "recommended" extensions. Install with the following fish-shell snippet

    ```fish
    for ext in (jq .recommendations[] -r install/extensions.json)
      code --install-extension $ext
    end
    ```

- Neovim extensions. First, install [paq](https://github.com/savq/paq-nvim) (a package manager) with the following

    ```bash
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
    ```

  Then run `:PaqInstall` inside Neovim.

## macOS specific

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

Change caps lock to control.

> System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

Download and install color schemes manually from <https://iterm2colorschemes.com/>. I like 'Monokai Soda'.

The `mac.sh` shell script contains a collection of nice-to-have defaults that you would otherwise set using System Preferences. This is derived from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles).

### Desktop applications

I install the following applications "manually".

- Brave
- iStat Menus
- iTerm
- KeepingYouAwake
- Obsidian
- ProtonVPN
- Signal
- Spotify
- Transmission
