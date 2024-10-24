{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    
    clang
    go 
    
    openjdk17-bootstrap
    
    postgresql_13

    github-desktop
    
    android-tools
    vscode
    android-studio

    jetbrains.idea-community-bin
    netbeans

    jetbrains.pycharm-community-bin 
   
    waydroid 
  ];

}

