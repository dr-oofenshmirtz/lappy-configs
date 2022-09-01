{ pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  virtualisation.virtualbox.guest.enable = true;

  environment = {
    systemPackages = with pkgs; [
      spice-vdagent #For Paste into gnome VM
    ];
  }

  services = {
    spice-vdagentd.enable  = true;
  };

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
