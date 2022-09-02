{ config, lib, pkgs, ... }:

let
  colors = import ../themes/colors.nix;
in
{
  home.packages = [ pkgs.libnotify ];
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
      size = "16x16";
    };
    settings = with colors.scheme.doom; {
      global = {
        width = 300;
        height = 200;
        origin = "top-right";
        offset = "50x50";
        shrink = "yes";
        transparency = 10;
        padding = 16;
        horizontal_padding = 16'
        frame_width = 3;
        frame_color = "#${bg}";
        separator_color = "frame";
        font = "FiraCode Nerd Font 10";
        line_height = 4;
        idle_threshold = 120;
        markup = "full";
        format = ''<b>%s</b>\n%b'';
        alignment = "left";
        vertical_alignment = "center";
        icon_position = "left";
      };
    };
  };
  xdg.dataFile."dbus-1/services/org.knopwob.dunst.service".source = "${pkgs.dunst}/share/dbus-1/services/org.knopwob.dunst.service";
}
