{ config, pkgs, ... }:
{
    qt = {
      enable = true;

      style = {
          name = "adwaita-dark";
          package = pkgs.adwaita-qt;
      };

    };


    gtk = {
      enable = true;

      cursorTheme = {
          name = "Bibata-Original-Ice";
          package = pkgs.bibata-cursors;
      };

      theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
      };

      iconTheme = {
          name = "Papirus-Icon-Theme";
          package = pkgs.papirus-icon-theme;
      };

    };

}
