{ config, pkgs, host, username, options, lib, inputs, system, ... }:
{
    boot = {
        kernelPackages = pkgs.linuxPackages_latest; # Kernel

        kernelParams = [
            "nowatchdog" 
            "modprobe.blacklist=sp5100_tco" #watchdog for AMD
            "modprobe.blacklist=iTCO_wdt" #watchdog for Intel
 	      ];

        # This is for OBS Virtual Cam Support
        kernelModules = [ "v4l2loopback" ];
        extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    
        initrd = { 
        availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
        kernelModules = [ ];
        };

        # Make /tmp a tmpfs
        tmp = {
            useTmpfs = false;
            tmpfsSize = "30%";
        };
    
        # Appimage Support
        binfmt.registrations.appimage = {
            wrapInterpreterInShell = false;
            interpreter = "${pkgs.appimage-run}/bin/appimage-run";
            recognitionType = "magic";
            offset = 0;
            mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
            magicOrExtension = ''\x7fELF....AI\x02'';
        };
    
        plymouth.enable = true;
    
    };

}

