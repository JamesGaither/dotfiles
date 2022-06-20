# James' Dotfiles
A repo for tracking my dotfiles

## How to start using on a new system
1. clone repo into a new folder i.e. dotfiles `git clone --bare git@github.com:JamesGaither/dotfile.git dotfiles`
2. In `.bashrc` add a new alias `alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`. Either sign in/out or source the .bashrc file to take effect.
3. Check out the newly cloned files `config checkout`. Remove or backup any file conflicts that might occur.

## Vim Plugins
As these dotfiles use vim-plug, this is how to install it.
1. download vim-plug 
   ```sh
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \  
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```
2. After download, reload .vimrc and :PlugInstall to install plugins.

## Tmux Plugins
This repo also has tmux plugins.
1. Clone Tmux plugin manager: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Reload tmux plugin if currently using. 
3. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
4. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.
