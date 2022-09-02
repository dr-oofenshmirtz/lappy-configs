{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.xsession.enable) {
    services.picom = {
      enable = true;
      package = pkgs.picom.overrideAttrs(o: {
        src = pkgs.fetchFromGitHub {
          repo = "picom";
          owner = "pijulius";
          rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
          sha256 = "YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
        };
      });
      backend = "glx";
      vSync = true;

      shadow = false;
      shadowOpacity = 0.75; #????
      fade = true;
      fadeDelta = 10;
      opacityRules = [
        "80:class_i *= 'discord'"
        "80:class_i *= 'emacs'"
        "80:class_i *= 'kitty'"
      ];
      settings = {
        daemon = true;
        use-damage = false;
        resize-damage = 1;
        refresh-rate = 0;
        corner-radius = 5;
        round-borders = 5; 

        animations = true;
        animation-window-mass = 0.5;
        animation-for-open-window = "zoom";
        animation-stiffness = 350;
        animation-clamping = false;
        fade-out-step = 1;

        detect-rounded-corners = true;
        detect-client-opactiy = false;
        detect-transient = true;
        detect-client-leader = true;
        mark-wmwim-focused = true;
        mark-ovredir-focues = true;
        unredir-if-possible = true;
        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
      };
    };
  };
}
