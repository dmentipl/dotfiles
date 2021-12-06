{ config, pkgs, ... }:

let

  dotfilesDev = ../../../repos/dotfiles/dev;

in {

  # Symlink these dotfiles.
  home.file = {
    conda = {
      source = dotfilesDev + /python/condarc;
      target = ".condarc";
    };
  };

}
