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

  home.file.".config/fish/config.fish".source = ../../repos/dotfiles/config/config.fish;
  home.file.".gitconfig".source = ../../repos/dotfiles/config/gitconfig;
  home.file.".gitignore".source = ../../repos/dotfiles/config/gitignore;
  home.file.".config/starship.toml".source = ../../repos/dotfiles/config/starship.toml;
  home.file.".tmux.conf".source = ../../repos/dotfiles/config/tmux.conf;
  home.file.".config/nvim/init.nvim".source = ../../repos/dotfiles/config/vimrc;
  home.file."/Users/daniel/Library/Application Support/Code/User/settings.json".source = ../../repos/dotfiles/config/settings.json;
}
