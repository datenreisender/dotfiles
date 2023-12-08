eval $(/opt/homebrew/bin/brew shellenv)

PATH=$PATH:~/bin:node_modules/.bin

export EDITOR="mate -w"

HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

alias g=git
alias ga="git add"
alias gaa="git add --all && gs"
alias gc="git commit"
alias gca="gc -a"
alias gci="gc"
alias gcnv="gc --no-verify"
alias gco="git checkout"
alias gd="git diff --ignore-space-change"
alias gdc="gd --cached"
alias gl="git log"
alias gsl="git smart-log"
alias gs="git status"
alias gsp="git smart-pull"
alias ggrep="git grep"

function gp {
  git push "$@" || osascript -e 'display notification "push failed" with title "git" sound name "default"'
}

function rmdir {
	rm -f "$1"/.DS_Store
	/bin/rmdir "$@"
}

function touchx {
  touch "$@"
  chmod +x "$@"
}

alias cask="brew cask"

alias h=history

alias l="ls -l"
alias ll="ls -al"
alias grep="grep --colour=auto"
alias idea="open -a Intellij\ IDEA"

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  [[ -f "${HOMEBREW_PREFIX}/opt/autoenv/activate.sh" ]] && . "${HOMEBREW_PREFIX}/opt/autoenv/activate.sh"
  [[ -f "${HOMEBREW_PREFIX}/etc/profile.d/z.sh" ]] && . "${HOMEBREW_PREFIX}/etc/profile.d/z.sh"
fi

PS1='\[\033[0;32m\]$(__git_ps1 "%s ")\[\033[0m\]\w \$ '

[ -f ~/.private/.bash_profile-private ] && . ~/.private/.bash_profile-private
