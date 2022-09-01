{ pkgs, ... }:

let 
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
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
      NCDU
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

  home.file.".emacs.d/init.el".text = ''
    (load "default.el")
  '';

  services.emacs = {
    enable = true;
    package = programs.emacs.package;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ../../ext/astro/*)
    ];
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "zsh-autosuggestions" "web-search" ];
    };
  };
};




}
