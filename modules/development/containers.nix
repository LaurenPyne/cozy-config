{ pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  environment.systemPackages = with pkgs; [
    # ===== Containers =====
    podman
    podman-compose

    # ===== Sandboxing =====
    bubblewrap
  ];
}
