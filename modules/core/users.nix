{ pkgs, ... }:

{
  users.users.pynezz = {
    isNormalUser = true;
    description = "pynezz";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      thunderbird
    ];
  };
}
