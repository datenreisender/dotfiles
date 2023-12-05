set -g fish_user_paths /usr/local/opt/ruby/bin $fish_user_paths

# set NODE_TO_USE 18
if set --query NODE_TO_USE
    # echo Using Node $NODE_TO_USE
    set -g fish_user_paths "/usr/local/opt/node@$NODE_TO_USE/bin" $fish_user_paths
    set -gx LDFLAGS "-L/usr/local/opt/node@$NODE_TO_USE/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/node@$NODE_TO_USE/include"
end

# set -g LANG en_GB.UTF-8

# Enable VS code terminal shell integration manually: https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)
