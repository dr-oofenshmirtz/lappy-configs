{ config, pkgs, user, inputs, nix-doom-emacs, ... } :


{
  home = {
    stateVersion = "22.05";
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      firefox

      feh
      mpv
      vlc   
    ];
  };

  imports = [ inputs.nix-doom-emacs.hmModule ];
  
  programs = {
    home-manager.enable = true;
    doom-emacs = {
      enable = true;
      doomPrivateDir = ../module/dev/doom.d;
    };
  };

  xsession = {
    enable = true;
  };
}
