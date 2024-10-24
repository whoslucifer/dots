{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      ags        
      gnome-system-monitor
      grim
      gtk-engine-murrine #for gtk themes
      hyprcursor # requires unstable channel
      hypridle # requires unstable channel
      imagemagick 
      inxi
      jq
      libsForQt5.qtstyleplugin-kvantum #kvantum
      
      nwg-look # requires unstable channel
      nvtopPackages.full
      pamixer
      pavucontrol
      polkit_gnome
      pyprland
      qt5ct
      qt6ct
      qt6.qtwayland
      qt6Packages.qtstyleplugin-kvantum #kvantum
      slurp
      swappy
      swaynotificationcenter
      swww
      wlogout

  ];
}

