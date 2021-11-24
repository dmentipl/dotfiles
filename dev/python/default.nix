{ config, pkgs, ... }:

let

  dotfilesDevPython = ../../../../repos/dotfiles/dev/python;

in {

  # Symlink these dotfiles.
  home.file = {
    fish-conda-init = {
      source = dotfilesDevPython + /conda-init.fish;
      target = ".config/fish/functions/conda-init.fish";
    };
    flake8 = {
      source = dotfilesDevPython + /flake8;
      target = ".config/flake8";
    };
  };

}
