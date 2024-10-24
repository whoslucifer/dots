{ config, pkgs, ... }:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    mpv
    cava
    ani-cli
    manga-cli
    vlc
    yt-dlp
    eog

    chromium
    google-chrome
  ];

}

