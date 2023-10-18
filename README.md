# James' Dotfiles
A repo for tracking my dotfiles. 
This repo is a WIP moving from traditional dotfile management over to nix home-manager managed.

## Installation guide
1. Install curl and apt via your package manager i.e. `sudo apt install curl git`
2. install nix via a multi-user install: `sh <(curl -L https://nixos.org/nix/install) --daemon`
3. clone this repo 
5. run `nix run home-manager/master -- switch --flake .#<profile>` to install and activate home-manager where profile is either `server` or `desktop`.

