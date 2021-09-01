{ config, pkgs, ... }:

let

  dotfilesDevHaskell = ../../../../repos/dotfiles/dev/haskell;

in {

  # Symlink these dotfiles.
  home.file = {
    fish-haskell-init = {
      source = dotfilesDevHaskell + /haskell-init.fish;
      target = ".config/fish/functions/haskell-init.fish";
    };
  };

}
