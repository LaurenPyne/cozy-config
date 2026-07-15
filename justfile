default:
    @just --list

status:
    git status

fmt:
    treefmt

pre-commit:
    git add .
    pre-commit run --all-files

check:
    nix flake check

build:
    just fmt
    just pre-commit
    git add .
    sudo nixos-rebuild build --flake .#Cozy

switch:
    just fmt
    just pre-commit
    git add .
    sudo nixos-rebuild switch --flake .#Cozy

update:
    nix flake update

commit message:
    git add .
    git commit -m "{{message}}"

push:
    git push

sync:
    git add .
    git commit -m "Update configuration"
    git push
