{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Python
    python3
    python314Packages.tkinter
    uv
  ];
}
