# dotfiles

> dotfiles for macOS and Linux machines with nix

## Description

This is a set of dotfiles and installation scripts appropriate for machines running macOS and Linux using [nix](https://nixos.org/) and [home-manager](https://github.com/nix-community/home-manager).

A small caveat: these files are useful to me, i.e. [@dmentipl](https://github.com/dmentipl); they *might* also be useful to you.

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

Each time you make a change to `home.nix` or any other file you need to run the home-manager switch command to apply the new configuration.

## Further details

### Managed by nix and home-manager

Nix and home-manager manage the installation of applications such as: bat, dust, exa, fd, fish, fzf, htop, jq, neovim, pandoc, procs, ripgrep, sd, starship, tmux, trash, and vscode. See [`home.nix`](home.nix) and files imported therein for further details.

Nix and home-manager also manages the configuration of those applications, including via symlinking of dotfiles to the appropriate locations in `$HOME`. This includes dotfiles such as `config.fish`, `git/config`, `init.lua`, `settings.json`, `starship.toml`, and `tmux.conf`, for example.

### Not managed by nix or home-manager

The following are not *yet* managed by nix or home-manager.

- macOS defaults. See `base/mac/mac.sh` for details. To set defaults, run the script as follows

    ```bash
    bash install/mac.sh
    ```

- VS Code extensions. Install with the following fish-shell snippet

    ```fish
    for ext in (jq .recommendations[] -r install/extensions.json)
      code --install-extension $ext
    end
    ```

    See `base/vscode/extensions.json` for the list of "recommended" extensions.

- Neovim extensions. First, install [paq](https://github.com/savq/paq-nvim) (a package manager) with the following

    ```fish
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
    ```

  Then run `:PaqInstall` inside Neovim. See `base/nvim/init.lua` for the list of extensions.

- [Marp](https://marpit.marp.app/) for markdown slides. Install the stand-alone binary as follows (choosing the latest version number)

    ```fish
    wget https://github.com/marp-team/marp-cli/releases/download/v1.2.0/marp-cli-v1.2.0-mac.tar.gz
    extract marp-cli-v1.2.0-mac.tar.gz
    mv marp ~/bin
    ```

In addition, the following GUI applications that I use are not *yet* managed by nix or home-manager:

- Brave
- iStat Menus
- iTerm
- KeepingYouAwake
- Obsidian
- ProtonVPN
- Signal
- Spotify
- Transmission

### macOS

To install the Xcode command line tools (which include git and other basic programs) run:

```bash
xcode-select --install
```

Change caps lock to control.

> System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

Download and install color schemes manually from <https://iterm2colorschemes.com/>. I like 'Monokai Soda'.
