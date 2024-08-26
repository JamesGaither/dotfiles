# James' Dotfiles
A repo for tracking my dotfiles and NixOS configs.

## Installation guide (for non-nixos distros)
1. Install curl and apt via your package manager i.e. `sudo apt install curl git`
2. install nix via a multi-user install: `sh <(curl -L https://nixos.org/nix/install) --daemon`
3. clone this repo 
4. run `nix run home-manager/master -- switch --flake .#<profile>` to install and activate home-manager where profile is the profile you want (generally `{username}`.

## Notes
This repos is currently a WIP and constantly changing. I am adding both a home-manager dotfile manager and a NixOS config manager.
For the most part, this is working and is operational on the `main` branch. It is important to note this repo is for my own personal usage so it is not setup for general usage. If you do run across this repo, feel free to clone it and make adjustments to have it work on your system. I welcome pull requests and issues that might improve this repo.

