{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ===== Rust =====
    rustc
    cargo
    rustfmt
    clippy

    # ===== Python =====
    python3
    uv

    # ===== Lua =====
    lua
    luarocks

    # ===== C / C++ Toolchain =====
    gcc
    gnumake
    pkg-config

    # ===== General Build Tools =====
    cmake
    ninja

    # ===== Version Control =====
    git
  ];
}
