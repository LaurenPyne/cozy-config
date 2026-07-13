default:
    @just --list

status:
    git status

build:
    git add .
    sudo nixos-rebuild build --flake .#Cozy

switch:
    git add .
    sudo nixos-rebuild switch --flake .#Cozy

update:
    nix flake update

fmt:
    nix fmt

commit message:
    git add .
    git commit -m "{{message}}"

push:
    git push

sync:
    git add .
    git commit -m "Update configuration"
    git push
