{ config, lib, pkgs, ... }:

{
  imports = [
    ../services/picom.nix
    ../services/polybar.nix
    ../services.sxhkd.nix    
  ];

  xsession = {
    enable = true;
    windowManager = {
      enable = true;
      #rules = [];
      #extraConfig = ''
      # ''
    };
  }
}
