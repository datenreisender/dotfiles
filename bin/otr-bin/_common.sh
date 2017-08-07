#!/bin/bash

OTR_SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

LOCAL_DOWNLOAD_DIR="$HOME/Downloads/OTR"

# MOUNT_DIR="$HOME/OTR-local"
# CENTRAL_DOWNLOAD_DIR="$MOUNT_DIR/kodierte Dateien"
CENTRAL_DOWNLOAD_DIR="$HOME/OTR/kodierte Dateien"

DOWNLOADS="$HOME/downloads.txt"
FAILURES="$HOME/downloads-failures.txt"
DOUBLEFAILURES="$HOME/downloads-fail-failures.txt"

function try_to_mount_central {
  # umount /Volumes/Filmlager 2> /dev/null
  # umount "$MOUNT_DIR" 2> /dev/null
  #
  # mount_afp afp://Kathedrale._afpovertcp._tcp.local/Filmlager "$MOUNT_DIR"

  true
}

function cd_to_download_dir {
  try_to_mount_central

  if [ -d "$CENTRAL_DOWNLOAD_DIR" ]; then
    cd "$CENTRAL_DOWNLOAD_DIR"
  else
    cd "$LOCAL_DOWNLOAD_DIR"
  fi
}

function print_failures {
  if [ -a "$FAILURES" ]; then
    printf "\33[31mFailed to download:\33[33m\n"
    cat "$FAILURES"
    printf "\33[39m"

    if [ -a "$DOUBLEFAILURES" ]; then
      printf "\33[31mFailed twice to download:\33[33m\n"
      cat "$DOUBLEFAILURES"
      printf "\33[39m"
    else
      printf "\33[32mBut have no double download failures!\33[39m\n"
    fi
  else
    printf "\33[32mNo download failures. Hooray!\33[39m\n"
  fi
}

function print_current_files {
  printf "\33[33mSee what we got here:\33[39m\n"
#  find . -not -name .DS_Store -ctime -1d -type f -print0 | xargs -0 ls -lh
  find . -not -name .DS_Store -ctime -1d -type f -ls
#  ls -lt
}
