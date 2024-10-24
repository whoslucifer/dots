{ config, pkgs, host, username, options, lib, inputs, system, ... }:
{
    programs = {
	      hyprland = {
          enable = true;
		      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; # xdphls
  	      xwayland.enable = true;
        };

	      git.enable = true;
	      waybar.enable = true;
	      hyprlock.enable = true;
        nm-applet.indicator = true;

	      thunar.enable = true;
	      thunar.plugins = with pkgs.xfce; [
		        exo
		        mousepad
		        thunar-archive-plugin
		        thunar-volman
		        tumbler
  	    ];
	
        virt-manager.enable = false;
    
        #steam = {
        #  enable = true;
        #  gamescopeSession.enable = true;
        #  remotePlay.openFirewall = true;
        #  dedicatedServer.openFirewall = true;
        #};
    
        xwayland.enable = true;

        dconf.enable = true;
        seahorse.enable = true;
        fuse.userAllowOther = true;
        mtr.enable = true;
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };

    };
}
