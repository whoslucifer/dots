{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./homemanager/themes.nix
    ./homemanager/modules/terminals.nix
    ./homemanager/modules/tmux.nix
    ./homemanager/modules/neovim.nix
    ./homemanager/modules/tmux.nix
  ];

  home.username = "asherah";
  home.homeDirectory = "/home/asherah";

  home.packages = let
    nerdfonts = pkgs.nerdfonts.override {
      fonts = [
        "Ubuntu"
        "UbuntuMono"
        "CascadiaCode"
        "FantasqueSansMono"
        "FiraCode"
      ];
    };
  in [nerdfonts];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.gammastep = {
    enable = true;
    dawnTime = "08:00";
    duskTime = "08:00";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
