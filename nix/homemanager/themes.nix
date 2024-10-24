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
          name = "Bibata-Modern-Ice";
          package = pkgs.bibata-cursors;
      };

      theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
      };

      iconTheme = {
          name = "Adwaita-Icon-Theme";
          package = pkgs.adwaita-icon-theme;
      };

    };

}
