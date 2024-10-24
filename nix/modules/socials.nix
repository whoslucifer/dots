{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    slack
    zoom-us
    discord

  ];
}

