# Cozy - Task Runner
#
# Run `just` to see available commands.

default:
    @just --list

# Build the system without activating it
build:
    sudo nixos-rebuild build --flake .#Cozy

# Build and activate the configuration
switch:
    sudo nixos-rebuild switch --flake .#Cozy

# Update flake inputs
update:
    nix flake update

# Format all Nix files
fmt:
    nix fmt

# Show repository status
status:
    git status

# Show recent commits
log:
    git log --oneline --graph --decorate -10

# Push current branch
push:
    git push

# Pull latest changes
pull:
    git pull

# Validate the configuration
validate:
    @echo "==> Formatting..."
    nix fmt

    @echo "==> Building..."
    sudo nixos-rebuild build --flake .#Cozy

    @echo ""
    @echo "✓ Validation complete."

# Remove old system generations
clean:
    sudo nix-collect-garbage -d

# Show flake metadata
info:
    nix flake metadata
