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

update:
    nix flake update

check:
    nix flake check

clean:
    nix store gc

fmt:
    nix fmt

status:
    git status

push:
    git push

log:
    git log --oneline --graph --decorate --all
