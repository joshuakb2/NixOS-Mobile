{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote }: {
    nixosConfigurations.NixOS-Mobile = nixpkgs.lib.nixosSystem {
      system = "x86-64_linux";
      modules = [
        lanzaboote.nixosModules.lanzaboote
        ./configuration.nix
      ];
    };
  };
}
