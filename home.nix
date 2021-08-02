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
    vscode
    watch
    wget
    zoxide
    zsh
  ];

  # Symlink these dotfiles.
  home.file = {
    bash = {
      source = repo + /profile;
      target = ".profile";
    };
    fish = {
      source = repo + /config.fish;
      target = ".config/fish/config.fish";
    };
    fish-conda-init = {
      source = repo + /conda-init.fish;
      target = ".config/fish/functions/conda-init.fish";
    };
    fish-extract = {
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
    zsh = {
      source = repo + /profile;
      target = ".zprofile";
    };
  };

}
