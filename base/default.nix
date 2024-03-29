{ config, pkgs, ... }:

let

  dotfilesBase = ../../../repos/dotfiles/base;

in {

  # Packages to install.
  home.packages = with pkgs; [
    bash
    bat
    curl
    delta
    direnv
    du-dust
    emacsNativeComp
    exa
    fd
    fish
    fzf
    gh
    git
    htop
    jq
    just
    llvm # Required for ghc (Haskell)
    neovim
    pandoc
    procs
    ripgrep
    sd
    shellcheck
    tmux
    trash-cli
    up
    watch
    wget
    zoxide
    zsh
  ];

  # Symlink these dotfiles.
  home.file = {
    bash = {
      source = dotfilesBase + /shells/profile;
      target = ".profile";
    };
    fish = {
      source = dotfilesBase + /shells/config.fish;
      target = ".config/fish/config.fish";
    };
    fish-extract = {
      source = dotfilesBase + /shells/extract.fish;
      target = ".config/fish/functions/extract.fish";
    };
    gitconfig = {
      source = dotfilesBase + /git/config;
      target = ".config/git/config";
    };
    gitignore = {
      source = dotfilesBase + /git/ignore;
      target = ".config/git/ignore";
    };
    iterm = {
      source = dotfilesBase + /terminals/iterm-profile.json;
      target = "Library/Application Support/iTerm2/DynamicProfiles/iterm-profile.json";
    };
    nvim = {
      source = dotfilesBase + /editors/init.lua;
      target = ".config/nvim/init.lua";
    };
    starship = {
      source = dotfilesBase + /shells/starship.toml;
      target = ".config/starship.toml";
    };
    tmux = {
      source = dotfilesBase + /shells/tmux.conf;
      target = ".config/tmux/tmux.conf";
    };
    vscode-settings = {
      source = dotfilesBase + /editors/settings.json;
      target = "Library/Application Support/VSCodium/User/settings.json";
    };
    vscode-keybindings = {
      source = dotfilesBase + /editors/keybindings.json;
      target = "Library/Application Support/VSCodium/User/keybindings.json";
    };
    zsh = {
      source = dotfilesBase + /shells/profile;
      target = ".zprofile";
    };
  };

}
