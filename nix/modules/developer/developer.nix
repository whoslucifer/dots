{
  config,
  pkgs,
  username,
  ...
}: {
  # postgresql
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    # dataDir = "/data/postgresql";
  };

  environment.systemPackages = with pkgs; [
    clang
    go

    openjdk17-bootstrap

    github-desktop

    android-tools
    vscode
    android-studio
    android-studio-tools
    gradle

    nodejs
    yarn

    jetbrains.idea-community-bin
    netbeans

    jetbrains.pycharm-community-bin

    arduino
    arduino-ide

    waydroid
  ];
}
