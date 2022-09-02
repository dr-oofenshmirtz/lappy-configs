{ lib, inputs, system, home-manager, user, doom-emacs-nix, ... }:

{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./shared-config.nix
      ./laptop/config.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user inputs; };
        home-manager.users.${user} = { pkgs, ... }: {
          imports = [( import ./home.nix )] ++
            [(import ./laptop/home.nix)] ++
            [ doom-emacs-nix.hmModule ];
          programs.doom-emacs = {
            enable = true;
            doomPrivateDir = ./doom.d;
            emacsPackagesOverlay = self: super: {
              # fixes https://github.com/vlaci/nix-doom-emacs/issues/394
              gitignore-mode = pkgs.emacsPackages.git-modes;
              gitconfig-mode = pkgs.emacsPackages.git-modes;
            };
          };
        };
      }
    ];
  };
  vm = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./shared-config.nix
      ./vm/config.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = {
          imports = [( import ./home.nix )] + (import ./vm/home.nix);
        };
      }
    ];
  };
}
