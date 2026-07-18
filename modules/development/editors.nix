{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ===== Editors =====
    neovim
    vscode

    # ===== Editor Plugins =====
    vimPlugins.lazy-nvim

    # ===== Version Control =====
    git

    # ===== Search & Navigation =====
    ripgrep
    fd
    tree

    # ===== Syntax & Parsing =====
    tree-sitter
  ];
}
