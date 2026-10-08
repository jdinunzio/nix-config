{ config, pkgs, ... }:

{
  networking.hostName = "mcfly";

  imports = [
    # host specific hardware configuration
    ./hardware-configuration.nix
    ../../system/nix.nix
    ../../system/nix-extra-options.nix
    ../../system/config-linux.nix
    ../../system/config-linux-net.nix
    ../../system/packages-linux.nix
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "gb";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "dual";
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
        ReconnectIntervals = "1,2,4,8,16,30";
        ResumeDelay = 1;
      };
    };
  };

  # Prevent this headset's AVRCP input device from sending play/pause events.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="input", ATTR{name}=="soundcore R50i NC (AVRCP)", ATTR{inhibited}="1"
  '';
}
