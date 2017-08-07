#!/bin/sh

DOWNLOADS="$1"
FAILURES="$2"

if [ -a "$FAILURES" ]; then
	trash "$FAILURES"
fi

df -h .

# readonly CURL=/usr/local/Cellar/curl/7.51.0/bin/curl
readonly CURL=curl

cat "$DOWNLOADS" | while read f; do
  $CURL -C - -v --retry 600 --retry-delay 60 -O $f
	if [ $? -ne 0 ]; then
		printf "\33[31mFailed to download:\33[33m $f\n\33[39m"
		echo $f >> "$FAILURES"
	fi
#   2>&1 | grep 'X-OTR-Queueposition\|Date' | perl -pe '$| =1; s/GMT\n//'
done

df -h .
