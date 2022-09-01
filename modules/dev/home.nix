{ pkgs, lib, config, user, ... }:

let 
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
    sha256 = "sha256:1g0izscjh5nv4n0n1m58jc6z27i9pkbxs17mnb05a83ffdbmmva6";
  }) {
    doomPrivateDir = ./doom.d; # directory containing config.el init.el
                               # and packages.el files
    
  };
in
{
  home = {
    packages = with pkgs; [
      # generic tools
      doom-emacs
      emacs28Packages.helm
      fd
      fzf
      gh
      git
      htop
      lazygit
      ncdu
      neovim
      ripgrep
      vim

      # python
      python3

      # js
      nodejs
      nodePackages.npm
      nodePackages.prettier
      yarn

      # rust stuff
      cargo
      rust-analyzer
      rustc
      rustup
    ];

  file.".emacs.d/init.el".text = ''
    (load "default.el")
  '';
  };
}
