{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.xfce = {
      enable = true;
      enableXfwm = false;
    };
    windowManager.bspwm.enable = true;

    displayManager.lightdm = {
      enable = true;
      background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
      autoLogin.enable = true;
      autoLogin.user = ${user}
    }
    displayManager.defaultSession = "none+bspwm";

    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
    '';
  };

  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    xclip
    xorg.xev
    xorg.xkill
    xorg.xrandr
    xterm
  ];
}
