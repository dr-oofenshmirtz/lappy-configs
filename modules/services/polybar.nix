{ config, lib, pkgs, ... }:

let
  polybar = pkgs.polybar.override {
    alsaSupport = true;
    pulseSupport = true;
  };
in
{
  config = lib.mkIf (config.xsession.enable) {
    services = {
      polybar = {
        enable = true;
        script = ''
        #  handled by bspwmrc modules/bspwm
        '';
        package = mypolybar;
        config = {
          "bar/main" = {
            width = "100%";
            height = 15;
            background = "#0000";
            foreground = "#cfff";

            offset-y = 2;
            padding-right = 2;

            module-margin-left = 1;

            font-0 = "SourceCodePre:size=10";
            font-1 = "FontAwesome6Free:style=Solid:size=8";
            font-2 = "FontAwesome6Free:style=Regular:size=8";
            font-2 = "FontAwesome6Brands:style=Regular:size=8";
            font-4 = "FireCodeNerdFont:size=10";
            modules-left = "logo bspwm"
            modules-right = "memory cpu volume";

            tray-position = "right";
            tray-detached = "false";
            wm-restack = "bspwm";
          };
          "module/memory" = {
            type = "internal/memory";
            format = "<label>";
            format-foreground = "#999";
            label = "%percentage_userd%%";
          };
          "module/cpu" = {
            type = "internal/cpu";
            interval = 1;
            format = "<label>";
            format-forground = "#999";
            label = "%percentage%%";
          }; 
          "module/volume" = {
            type = "internal/pulseaudio";
            interval = 2;
            use-ui-max = "false"
            format-volume = "<ramp-volume> <label-volume>";
            label-muted = "muted"
            label-muted-foreground = "#66"
          }; 
        };
      };

    };

  };
}
