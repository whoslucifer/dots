# this is the main default config
{
  config,
  pkgs,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: let
  inherit (import ./variables.nix) keyboardLayout;
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        requests
        pyquery # needed for hyprland-dots Weather script
      ]
  );
in {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../system/misc/intel-drivers.nix
    ../../system/misc/vm-guest-services.nix
    ../../system/misc/local-hardware-clock.nix

    ../../system/locales.nix
    ../../system/networking.nix
    ../../system/boot.nix
    ../../system/boot-loader.nix
    ../../system/themes.nix
    ../../system/hyprland.nix
    ../../system/system.nix

    ../../modules/nautilus.nix
    ../../modules/programs.nix
    ../../modules/virtualization.nix
    ../../modules/extra.nix
    ../../modules/sound.nix
    ../../modules/services.nix
    ../../modules/security.nix

    ../../modules/developer/developer.nix

    ../../modules/pentester/pentester.nix
    ../../modules/pentester/blueducky.nix

    ../../modules/productivity.nix
    ../../modules/socials.nix
    ../../modules/media.nix
    ../../modules/utils.nix
    ../../modules/spicetify.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # System Users
  users = {
    mutableUsers = true;
  };

  # Python Packages for Hyprland scripts
  environment.systemPackages =
    (with pkgs; [
      vim
    ])
    ++ [
      python-packages
    ];

  # System version
  system.stateVersion = "24.05";
}
