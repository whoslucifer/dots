{
  config,
  pkgs,
  ...
}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    easyeffects
  ];
}
