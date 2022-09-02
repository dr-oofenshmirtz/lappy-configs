{ pkgs, lib, config, user, ... }:

{
  home = {
    packages = with pkgs; [
      # generic tools
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
  };
}
