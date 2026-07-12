{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    nixosConfigurations.Cozy = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
        ./configuration.nix
      ];
    };
  };
}

