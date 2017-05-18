export EDITOR="mate -w"

alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gci="git commit -v"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log"
alias gsl="git smart-log"
alias gp="git push"
alias gs="git status"
alias gsp="git smart-pull"

alias cask="brew cask"

alias h=history

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[ -f /usr/local/opt/autoenv/activate.sh ] && . /usr/local/opt/autoenv/activate.sh

[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  export NVM_DIR="$HOME/.nvm"
  mkdir -p "$NVM_DIR"
  . "/usr/local/opt/nvm/nvm.sh"
fi

[ -f ~/.bash_profile-private ] && . ~/.bash_profile-private
