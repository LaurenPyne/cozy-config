default:
    @just --list

build:
    sudo nixos-rebuild build --flake .#Cozy

switch:
    sudo nixos-rebuild switch --flake .#Cozy

boot:
    sudo nixos-rebuild boot --flake .#Cozy

test:
    sudo nixos-rebuild test --flake .#Cozy

check:
    nix flake check

status:
    git status

log:
    git log --oneline --graph --decorate -15

update:
    nix flake update

clean:
    nix store gc

fmt:
    echo "Formatter will be added later."

