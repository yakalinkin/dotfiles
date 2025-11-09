export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mh"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nano"

# bin/*
export PATH="$HOME/bin:$PATH"

# NVM (Node Version Manager)
# For more information, visit: https://github.com/nvm-sh/nvm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
