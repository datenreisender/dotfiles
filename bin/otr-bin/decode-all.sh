#!/bin/sh

df -h .
printf '\n'

shopt -s nullglob

for a in *.otrkey; do
  printf "Decoding $a...\n"
  ~/bin/otr-bin/decode.sh "$a" && rm -v "$a"
  printf '... finished\n\n'
done

df -h .
