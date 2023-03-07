#!/bin/sh

#make some noise
mpg123 /etc/zi/sounds/keypress.mp3 &

#read from temporary file
lkchain=`cat /tmp/zi/last4keys`
echo currentchain: $lkchain

lua ~/Documents/zi/learning/lua/zi.lua key $lkchain

