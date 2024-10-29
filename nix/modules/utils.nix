{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    baobab
    btrfs-progs
    curl
    wget
    yazi
    cpufrequtils
    duf
    eza
    ffmpeg   
    glib #for gsettings to work
    gsettings-qt
    killall  
    libappindicator
    libnotify
    pciutils
    xdg-user-dirs 
    xdg-utils

    networkmanagerapplet
    unzip
    file-roller
   
    anyrun

    librsvg
    foot 
    kitty
    ranger
    tmux
    fastfetch
    fzf
    starship
    fuzzel
    wl-clipboard
    clipse
    cliphist
    yad
    file-roller
    file
    toybox
    
    #calc for wallpaper switching
    bc

    # screen recording
    wf-recorder

  ];
}

