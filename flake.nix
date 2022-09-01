{
  description = "home manager + flake config";
  inputs = 
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nix-doom-emacs.url = "github:vlaci/nix-doom-emacs";
      home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = inputs @ { self, nixpkgs, home-manager, nix-doom-emacs, ... }:
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
          inherit inputs user system home-manager nix-doom-emacs;
        }
      );
    };
}
