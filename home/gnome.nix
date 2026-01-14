{ gnome ? { textScalingFactor = 1.0; }, ... }:
{
  # GNOME desktop configuration
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      text-scaling-factor = gnome.textScalingFactor;
    };
  };
}
