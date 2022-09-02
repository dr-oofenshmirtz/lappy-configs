{
  description = "home manager + flake config";
  inputs = 
    {
      emacs-overlay = {
        url = "github:nix-community/emacs-overlay";
        flake = false;
      };
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      doom-emacs-nix = {
        url = "github:vlaci/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.emacs-overlay.follows = "emacs-overlay";
      };
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = inputs @ { self, nixpkgs, home-manager, doom-emacs-nix, ... }:
    let
      system = "x86_64-linux"; 
      user = "yolo";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;  # allows non-foss 
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs user system home-manager doom-emacs-nix;
        }
      );
    };
}
