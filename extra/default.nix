{ config, pkgs, ... }:

let

  dotfilesExtra = ../../../repos/dotfiles/extra;

in {

  # Packages to install.
  home.packages = with pkgs; [
    vale
  ];

  # Symlink these dotfiles.
  home.file = {
    vale = {
      source = dotfilesExtra + /vale/vale.ini;
      target = ".config/vale/vale.ini";
    };
  };

}
