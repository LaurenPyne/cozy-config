{
  description = "Cozy Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    nixosConfigurations.Cozy = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
        ./hosts/Cozy/configuration.nix
      ];
    };
  };
}
