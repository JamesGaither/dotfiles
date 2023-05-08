# James' Dotfiles
A repo for tracking my dotfiles. 
This repo is a WIP moving from traditional dotfile management over to nix home-manager managed.

## Installation guide (WIP)
1. Install curl and apt via your package manager i.e. `sudo apt install curl git`
2. install nix via a multi-user install: `sh <(curl -L https://nixos.org/nix/install) --daemon`
3. clone this repo 
4. symlink the flake.nix, flake.lock, and the home.nix to `/home/${USER}/.config/home-manager`. #TODO: Find an easier way to handle this.
5. run `nix run home-manager/master --switch` to install and activate home-manager.

