{ config, lib, ... }:

let

  # userDirectory is /home/ in Linux or /Users/ in macOS.
  userDirectory = let
    inherit (lib.systems.elaborate { system = builtins.currentSystem; })
      isLinux;
  in if isLinux then "/home/" else "/Users/";

in rec {

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow non-FOSS programs.
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "daniel";
  home.homeDirectory = userDirectory + home.username;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  imports = [
    ./base
    ./dev/haskell
    ./dev/python
  ];

}
