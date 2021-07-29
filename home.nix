{ config, pkgs, ... }:

let

  repo = ../../repos/dotfiles/config;

in {

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow non-FOSS programs.
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "daniel";
  home.homeDirectory = "/Users/daniel";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    bash
    bat
    curl
    du-dust
    exa
    fd
    fish
    fzf
    git
    htop
    neovim
    pandoc
    ripgrep
    sd
    starship
    tmux
    trash-cli
    vscode
    watch
    wget
    zsh
  ];

  home.file = {
    fish = {
      source = repo + /config.fish;
      target = ".config/fish/config.fish";
    };
    fish-function = {
      source = repo + /extract.fish;
      target = ".config/fish/functions/extract.fish";
    };
    gitconfig = {
      source = repo + /gitconfig;
      target = ".gitconfig";
    };
    gitignore = {
      source = repo + /gitignore;
      target = ".gitignore";
    };
    nvim = {
      source = repo + /init.lua;
      target = ".config/nvim/init.lua";
    };
    starship = {
      source = repo + /starship.toml;
      target = ".config/starship.toml";
    };
    tmux = {
      source = repo + /tmux.conf;
      target = ".tmux.conf";
    };
    vscode = {
      source = repo + /settings.json;
      target = "Library/Application Support/Code/User/settings.json";
    };
  };

}
