{ config, lib, pkgs, ... }:
with lib;
{
  imports = [
  ];

  host = {
    home = {
      applications = {
        android-tools.enable = mkDefault true;
        blueman.enable = mkDefault true;
        chromium.enable = mkDefault true;
        comma.enable = mkDefault true;
        diffuse.enable = mkDefault true;
        drawio.enable = mkDefault true;
        eog.enable = mkDefault true;
        ferdium.enable = mkDefault true;
        firefox.enable = mkDefault true;
        flameshot.enable = mkDefault true;
        gnome-encfs-manager.enable = mkDefault true;
        gnome-system-monitor.enable = mkDefault true;
        gparted.enable = mkDefault true;
        greenclip.enable = mkDefault true;
        hadolint.enable = mkDefault true;
        kitty.enable = mkDefault true;
        libreoffice.enable = mkDefault true;
        master-pdf-editor.enable = mkDefault true;
        mate-calc.enable = mkDefault true;
        nixfmt.enable = mkDefault true;
        nmap.enable = mkDefault true;
        opensnitch-ui.enable = mkDefault true;
        pinta.enable = mkDefault true;
        pulsemixer.enable = mkDefault true;
        seahorse.enable = mkDefault true;
        shellcheck = mkDefault true;
        shfmt = mkDefault true;
        smartgit.enable = mkDefault true;
        smplayer.enable = mkDefault true;
        sqlite-browser.enable = mkDefault true;
        thunar.enable = mkDefault true;
        thunderbird.enable = mkDefault true;
        virt-manager.enable = mkDefault true;
        visual-studio-code.enable = mkDefault true;
        wps-office.enable = mkDefault true;
        xdg-ninja.enable = mkDefault true;
        xmlstarlet = mkDefault true;
        yq = mkDefault true;
        yt-dlp.enable = mkDefault true;
        zenity.enable = mkDefault true;
        zoom.enable = mkDefault true;
      };
      feature = {
        fonts.enable = mkDefault true;
        mime-defaults.enable = mkDefault true;
        theming.enable = mkDefault true;
      };
      service = {
      };
    };
  };
}