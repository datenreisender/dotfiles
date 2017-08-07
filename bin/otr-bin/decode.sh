#!/bin/sh

. ~/.private/otr

#~/bin/otr-bin/otrdecoder -q -e "$otr_user" -p "$otr_pw" -i "$1"
~/bin/otr-bin/otrdecoder -e "$otr_user" -p "$otr_pw" -i "$1"
