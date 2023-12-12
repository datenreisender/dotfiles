# set NODE_TO_USE 18
if set --query NODE_TO_USE
    # echo Using Node $NODE_TO_USE
    set -g fish_user_paths "$HOMEBREW_PREFIX/opt/node@$NODE_TO_USE/bin" $fish_user_paths
    set -gx LDFLAGS "-$LHOMEBREW_PREFIX/opt/node@$NODE_TO_USE/lib"
    set -gx CPPFLAGS "-$IHOMEBREW_PREFIX/opt/node@$NODE_TO_USE/include"
end
