{ config, pkgs, ... }:
{
    # Bluetooth
    hardware = {
  	  bluetooth = {
	       enable = true;
	       powerOnBoot = true;
	       settings = {
		          General = {
		            Enable = "Source,Sink,Media,Socket";
		            Experimental = true;
		          
              };
         };
      };
    };
   

    # pipewire
    hardware.pulseaudio = {
        enable = false;
        extraModules = [ "module-bluetooth-policy" "module-bluetooth-discover" ];
    };

    environment.systemPackages = with pkgs; [
        pulseaudio
        bluez
        bluez-tools
        gnome-control-center

    ];

}

