{ config, pkgs, ... }:

{
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
    wget
    zsh
  ];

  home.file = {
    fish = {
      source = ../../repos/dotfiles/config/config.fish;
      target = ".config/fish/config.fish";
    };
    gitconfig = {
      source = ../../repos/dotfiles/config/gitconfig;
      target = ".gitconfig";
    };
    gitignore = {
      source = ../../repos/dotfiles/config/gitignore;
      target = ".gitignore";
    };
    nvim = {
      source = ../../repos/dotfiles/config/vimrc;
      target = ".config/nvim/init.nvim";
    };
    starship = {
      source = ../../repos/dotfiles/config/starship.toml;
      target = ".config/starship.toml";
    };
    tmux = {
      source = ../../repos/dotfiles/config/tmux.conf;
      target = ".tmux.conf";
    };
    vscode = {
      source = ../../repos/dotfiles/config/settings.json;
      target = "Library/Application Support/Code/User/settings.json";
    };
  };
}
