{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    sxhkd = {
      enable = true;
      keybindings = {
        "super + space" = "rofi -show drun"
        "super + print" = "flameshot gui";
      };
    };
  };
}
