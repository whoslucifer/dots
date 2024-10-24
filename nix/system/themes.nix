{ config, pkgs, ... }:
{
    fonts.packages = with pkgs; [
        noto-fonts
        fira-code
        noto-fonts-cjk
        jetbrains-mono
        font-awesome
        terminus_font
        (nerdfonts.override {fonts = ["JetBrainsMono"];})
        material-symbols
 	  ];

    environment.systemPackages = with pkgs; [
        symbola
    ];

}

