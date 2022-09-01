{ pkgs }:

{
  services = {
    emacs = {
      enable = true;
      package = programs.emacs.package;
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    # Try to figure out how to make astro nvim work
    #extraConfig = builtins.concatStringsSep "\n" [
      #(lib.strings.fileContents ../../ext/astronvim/init.lua)
      #(lib.strings.fileContents ../../ext/astronvim/config.ld)
    #];
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
}
