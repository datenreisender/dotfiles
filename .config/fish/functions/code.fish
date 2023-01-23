function code
  if count $argv >/dev/null
    command code $argv
  else
    command code -n .
  end
end
