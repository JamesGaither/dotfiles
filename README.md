# James' Dotfiles
A repo for tracking my dotfiles and NixOS configs.

## Installation guide (for non-nixos distros)
1. Install curl and apt via your package manager i.e. `sudo apt install curl git`
2. install nix via a multi-user install: `sh <(curl -L https://nixos.org/nix/install) --daemon`
3. clone this repo 
4. run `nix run home-manager -- switch --flake .#<profile>` to install and activate home-manager where profile is the profile you want (generally `{username}`. If you run it with a `.` instead of `.#<profile>`, it will use the username to determine the profile.
5. You have to setup your user to use zsh (home-manager does not handle this). To do so, add your zsh path (e.g. `/home/${USER}/.nix-profile/bin/zsh`) to `/etc/shells`. Then active this profile as your default using `chsh` which will prompt you for the default shell.

## Notes
This repo is working and is operational on the `main` branch. It is important to note this repo is for my own personal usage so it is not setup for general usage. If you do run across this repo, feel free to clone it and make adjustments to have it work on your system. I welcome pull requests and issues that might improve this repo.

