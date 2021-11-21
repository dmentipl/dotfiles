{ config, pkgs, ... }:

let

  dotfilesBase = ../../../repos/dotfiles/base;

in {

  # Packages to install.
  home.packages = with pkgs; [
    bash
    bat
    curl
    du-dust
    exa
    fd
    fish
    fzf
    gh
    git
    htop
    jq
    neovim
    pandoc
    procs
    ripgrep
    sd
    starship
    tmux
    trash-cli
    watch
    wget
    zoxide
    zsh
  ];

  # Symlink these dotfiles.
  home.file = {
    bash = {
      source = dotfilesBase + /shell/profile;
      target = ".profile";
    };
    fish = {
      source = dotfilesBase + /shell/config.fish;
      target = ".config/fish/config.fish";
    };
    fish-extract = {
      source = dotfilesBase + /shell/extract.fish;
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
    nvim = {
      source = dotfilesBase + /editor/init.lua;
      target = ".config/nvim/init.lua";
    };
    starship = {
      source = dotfilesBase + /shell/starship.toml;
      target = ".config/starship.toml";
    };
    tmux = {
      source = dotfilesBase + /shell/tmux.conf;
      target = ".config/tmux/tmux.conf";
    };
    vscode-settings = {
      source = dotfilesBase + /editor/settings.json;
      target = "Library/Application Support/Code/User/settings.json";
    };
    vscode-keybindings = {
      source = dotfilesBase + /editor/keybindings.json;
      target = "Library/Application Support/Code/User/keybindings.json";
    };
    zsh = {
      source = dotfilesBase + /shell/profile;
      target = ".zprofile";
    };
  };

}
