{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      brightnessctl
      playerctl
      doas
      bc 
   
  ];
}

