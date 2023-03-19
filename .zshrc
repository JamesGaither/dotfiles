# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load theme
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# Load in sub-configs
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Allow history
HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# 
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
export PATH="/home/jgaither/.local/bin:$PATH"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree $HOME'

# Make nim accesible
export PATH="/home/jgaither/.nimble/bin:$PATH"
