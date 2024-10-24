{ config, pkgs, ... }:

{
  imports = [
    ./homemanager/themes.nix

  ];



  home.username = "asherah";
  home.homeDirectory = "/home/asherah";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.hello

  ];
  
  

  home.file = {


  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  services.gammastep = {
    enable = true;
    dawnTime = "08:00";
    duskTime = "08:00";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
