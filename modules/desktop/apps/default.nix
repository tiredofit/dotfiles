{lib, ...}:

with lib;
{
  imports = [
    ./autorandr.nix
    ./autokey.nix
    ./cliphist.nix
    ./grim.nix
    ./hyprpaper.nix
    ./nwg-displays.nix
    ./redshift.nix
    ./slurp.nix
    ./sysstat.nix
    ./wdisplays.nix
    ./wev.nix
    ./wl-clipboard.nix
    ./wlr-randr.nix
    ./wlogout.nix
    ./xbindkeys.nix
    ./xdotool.nix
    ./xbacklight.nix
    ./xdpyinfo.nix
    ./xev.nix
    ./xprop.nix
  ];
}
