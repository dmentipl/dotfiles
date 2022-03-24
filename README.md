# dotfiles

> dotfiles for macOS machines with nix

## Description

This is a set of dotfiles and installation scripts appropriate for machines running macOS using [nix](https://nixos.org/) and [home-manager](https://github.com/nix-community/home-manager).

A small caveat: these files are useful to me, i.e. [@dmentipl](https://github.com/dmentipl); they *might* also be useful to you.

## Requirements

There are two main requirements:

1. Nix; see <https://nixos.org/guides/install-nix.html>.
2. Home-manager; see <https://github.com/nix-community/home-manager#installation>.

*Note*: if the nix command is not on the path run the following.

```zsh
. ~/.nix-profile/etc/profile.d/nix.sh
```

After installation, home-manager will ensure nix is properly configured.

## Usage

### Installation

1. Clone this repository locally (or download a tarball/zip archive) to

    ```zsh
    ~/repos/dotfiles
    ```

2. Symlink `home.nix` to `~/.config/nixpkgs`:

    ```zsh
    ln -s ~/repos/dotfiles/home.nix ~/.config/nixpkgs/home.nix
    ```

3. Run home-manager:

    ```zsh
    home-manager switch
    ```

### Update

Each time you make a configuration change in `home.nix` or its dependencies do the following.

```zsh
home-manager switch
```

To update all nix packages do the following.

```zsh
nix-channel --update

# NOTE: this may take a while
home-manager switch
```

This is analogous to `sudo apt upgrade`.

## Further details

### Managed by nix and home-manager

Nix and home-manager manage the installation of command-line applications such as: `bat`, `dust`, `exa`, `fd`, `fish`, `fzf`, `htop`, `jq`, `neovim`, `pandoc`, `procs`, `ripgrep`, `sd`, `tmux`, and `trash`. See [`home.nix`](home.nix) and files imported therein for further details.

Nix and home-manager also manages the configuration of those applications, including via symlinking of dotfiles to the appropriate locations in `$HOME`. This includes dotfiles such as `config.fish`, `git/config`, `init.lua`, `settings.json`, `starship.toml`, and `tmux.conf`, for example.

### Not managed by nix

#### Applications

The following applications are not managed by nix or home-manager.

- [marp](https://github.com/marp-team/marp-cli) to generate slides from markdown. Download the stand-alone binary from the GitHub releases page and put in `~/bin`.
- [pandiff](https://github.com/davidar/pandiff) for producing file diffs for any files that pandoc supports. Install with `node -g install pandiff` into an appropriate node installation.
- [starship](https://github.com/starship/starship) for a configurable command prompt. Download the stand-alone binary from the GitHub releases page and put in `~/bin`.
- [vale](https://github.com/errata-ai/vale) styles. Download styles and put in `~/.config/vale/styles`. The VS Code extension expects `.vale.ini` in the working directory, so symlink as follows: `ln -s ~/.config/vale .vale`. See [errata-ai/styles](https://github.com/errata-ai/styles) for a list of styles.
- [watchexec](https://github.com/watchexec/watchexec) to watch for file changes then execute a program. Download the stand-alone binary from the GitHub releases page and put in `~/bin`.

#### Extensions

The following extensions are not managed by nix or home-manager.

- [code](https://code.visualstudio.com/) extensions. Install with the following

    ```zsh
    for ext in $(jq '.recommendations[]' -r base/editor/extensions.json)
    do
      code --install-extension $ext
    done
    ```

    See `base/editor/extensions.json` for the list of "recommended" extensions.

- [neovim](https://neovim.io/) extensions. First, install [paq](https://github.com/savq/paq-nvim) (a package manager) with the following

    ```zsh
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
    ```

  Then run `:PaqInstall` inside Neovim. See `base/editor/init.lua` for the list of extensions.

## macOS

### Command line tools

To install the Xcode command line tools (which include git and other basic programs) run:

```zsh
xcode-select --install
```

### ssh keys

Generate a public-private key with the following.

```zsh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Start the ssh-agent in the background.

```zsh
eval "$(ssh-agent -s)"
```

The following goes in `~/.ssh/config`.

```text
Host *
  IgnoreUnknown UseKeychain
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Add the key to the ssh-agent.

```zsh
ssh-add -K ~/.ssh/id_ed25519
```

Then you can add the public key to, for example, GitHub via the web interface.

### Configuration

Configure macOS, e.g. Finder, the Dock, trackpad and keyboard, terminal. See [`mac.sh`](base/os/mac.sh) for details.

```zsh
base/os/mac.sh
```

*Note*: it seems that many settings cannot be scripted.

#### Require password immediately

1. System Preferences -> Security & Privacy -> General
2. Tick `Require password` and set to `"Immediately"`

#### Set caps lock key to no action

1. Go to System Preferences -> Keyboard -> Modifier Keys...
2. Set `Caps Lock Key` to `"No Action"`

#### Turn on night shift

1. System Preferences -> Displays -> Night Shift...
2. Set `Schedule` to `"Sunset to Sunrise"`

### Applications

Install the following applications manually.

- Brave
- iTerm
- Obsidian
- Signal
- Spotify
- Transmission
- VS Code

Install the following utilities manually.

- iStat Menus
- KeepingYouAwake
- ProtonVPN
- Sync

### Font

I like Fira Code font. Install manually from [here](https://github.com/tonsky/FiraCode).
