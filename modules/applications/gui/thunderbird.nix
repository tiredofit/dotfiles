{config, lib, pkgs, ...}:

let
  cfg = config.host.home.applications.thunderbird;
in
  with lib;
{
  options = {
    host.home.applications.thunderbird = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = "Mail, Calendar, and IM";
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs;
        [
          thunderbird
        ];
    };

    programs = {
      thunderbird = {
        enable = false;
        ## TODO - This needs conversion
      };
    };

    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [
          "workspace 1,class:(thunderbird)$"
          "float,class:^(thunderbird)$,title:^(.*)(Reminder)(.*)$"
          "float,class:^(thunderbird)$,title:^About(.*)$"
          "float,class:^(thunderbird)$,title:^(Check Spelling)$"
          "size 525 335,class:^(thunderbird)$,title:^(Check Spelling)$"
        ];
      };
    };
  };
}
