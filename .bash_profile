export EDITOR="mate -w"

alias ga="git add"
alias gc="git commit -v"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gs="git status"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[ -f /usr/local/opt/autoenv/activate.sh ] && . /usr/local/opt/autoenv/activate.sh

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  export NVM_DIR="$HOME/.nvm"
  mkdir -p "$NVM_DIR"
  . "/usr/local/opt/nvm/nvm.sh"
fi
