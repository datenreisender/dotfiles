#!/bin/bash

set -o xtrace
set -o errexit
set -o pipefail

SOURCE=/Volumes/Filmlager
TARGET="$HOME/var/existing_movies.txt"

if [ ! -e "$SOURCE" ]; then
    cat <<ERR

Source "$SOURCE" does not exist. Mount it first.

ERR
    exit 1
fi

find "$SOURCE"/{G,J,L,Mu,ko}* -type f -not -name '.*' \
  | perl -pe 's/^(.*?\/){2}//' \
  > "$TARGET"
