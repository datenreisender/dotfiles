function git
  if count $argv >/dev/null
    command git $argv
  else
    command git status
  end
end
