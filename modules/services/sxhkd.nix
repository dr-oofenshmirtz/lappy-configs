{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    services = {
      sxhkd = {
        enable = true;
        keybindings = {
          "super + space" = "rofi -show drun";
          "super + print" = "flameshot gui";
        };
      };
    };
  };
}
